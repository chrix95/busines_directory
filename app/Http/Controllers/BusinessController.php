<?php

namespace App\Http\Controllers;

use App\Business;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class BusinessController extends Controller
{
    public function __construct(UtilityController $utility) {
        $this->utility = $utility;
    }
    /**
     * Get all category
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index ()
    {
        $status = '00';
        $business = Business::all();
        return $this->utility->response($status, $business);
    }

    public function show (Request $request, $id)
    {
        $status = '00';
        $business = Business::find($id);
        $param = $request->query('view');
        if (!$business) {
            $status = '06';
            $business = [];
        }
        if ($param) {
            $newViews = $business->views + 1;
            $business->update(['views' => $newViews]);
            return response()->json(true);
        }
        return $this->utility->response($status, $business);
    }

    public function search (Request $request)
    {
        $param = $request->query('name');
        $business = [];
        if ($param) {
            $business = Business::where('name', 'like', '%' . $param . '%')
                                ->orWhere('description', 'like', '%' . $param . '%')
                                ->orderBy('rating', 'desc')->orderBy('views', 'desc')
                                ->get();
        }
        $status = '00';
        return $this->utility->response($status, $business);
    }

    public function store (Request $request) {
        $data = array(
            'name'          =>  $request->name,
            'address'       =>  $request->address,
            'phone'         =>  $request->phone,
            'email'         =>  $request->email,
            'image'         =>  $request->image,
            'website'       =>  $request->website,
            'description'   =>  $request->description
        );
        $validator = \Validator::make($data, [
            'name'          =>  'required|string|max:191|unique:businesses',
            'address'       =>  'required|string',
            'phone'         =>  'required|numeric|digits:11',
            'email'         =>  'required|string|email|max:191|unique:businesses',
            'website'       =>  'required|string|max:191',
            'image'         =>  'required|file|image|dimensions:width=320,height=320',
            'description'   =>  'required|string'
        ]);
        if($validator->fails()) {
            $status = '05';
            $response = $validator->errors();
        } else {
            // move image to server
            $fileName = time().'.'.$request->image->getClientOriginalExtension();
            $request->image->move(public_path('upload'), $fileName);
            $data['image'] = 'upload/' . $fileName;
            // create business
            $response = Business::create($data);
            // save selected category
            $category = explode(',', $request->category);
            foreach ($category as $key => $value) {
                $response->businesscategory()->create(['category_id' => $value]);
            }
            $status = '02';
        }
        return $this->utility->response($status, $response);
    }

    public function update (Request $request, $id) {
        $business = Business::find($id);
        if (!$business) {
            $status = '06';
            $response = [];
        } else {
            $data = array(
                'name'          =>  $request->name,
                'address'       =>  $request->address,
                'phone'         =>  $request->phone,
                'email'         =>  $request->email,
                'website'       =>  $request->website,
                'description'   =>  $request->description
            );
            $validator = \Validator::make($data, [
                'name'          =>  'string|max:191',
                'address'       =>  'string',
                'phone'         =>  'numeric|digits:11',
                'email'         =>  'string|email|max:191',
                'website'       =>  'string|max:191',
                'description'   =>  'string'
            ]);
            if($validator->fails()) {
                $status = '05';
                $response = $validator->errors();
            } else {
                if ($request->hasFile('image')) {
                    $this->validate($request, [
                        'image'     =>  'file|image|dimensions:width=320,height=320'
                    ]);
                    $image_path = $business->image; 
                    if(file_exists($image_path)) {
                        File::delete($image_path);
                    }
                    $fileName = time().'.'.$request->image->getClientOriginalExtension();
                    $request->image->move(public_path('upload'), $fileName);
                    $data['image'] = 'upload/' . $fileName;
                }
                if ($this->utility->uniqueBusiness($data['name'], $data['email'])) {
                    $status = '00';
                    $business->update($data);
                    $business->businesscategory()->delete();
                    // save selected category
                    $category = explode(',', $request->category);
                    foreach ($category as $key => $value) {
                        $business->businesscategory()->create(['category_id' => $value]);
                    }
                    $response = $business;
                } else {
                    $status = '01';
                    $response = [];
                }
            }
        }
        return $this->utility->response($status, $response);
    }

    public function destroy ($id) {
        $business = Business::find($id);
        if (!$business) {
            $status = '06';
            $response = [];
        } else {            
            $status = '07';
            $image_path = $business->image; 
            if(file_exists($image_path)) {
                File::delete($image_path);
            }
            // delete all additionally uploaded images
            foreach ($business->images as $key => $value) {
                if(file_exists($value->image)) {
                    File::delete($value->image);
                }
            }
            $business->businesscategory()->delete();
            $business->images()->delete();
            $business->ratings()->delete();
            $business->delete();
            $response = [];
        }
        return $this->utility->response($status, $response);
    }

    public function changeStatus ($id, $value) {
        $business = Business::find($id);
        if (!$business) {
            $status = '06';
            $response = [];
        } else {
            $status = '00';
            $business->update(['status' => $value]);
            $response = [];
        }
        return $this->utility->response($status, $response);
    }

    public function updateRating ($id, $value) {
        $business = Business::find($id);
        if (!$business) {
            $status = '06';
            $response = [];
        } else {
            $business->ratings()->create(['rating' => $value]);
            $fetchRating = Business::find($id)->ratings;
            if (count($fetchRating) == 0) {
                $response = ['rating' => number_format($value, 2)];
                $business->update(['rating' => $value]);
            } else {
                $result = $this->calculateAvgRating($fetchRating);
                $business->update(['rating' => $result]);
                $response = ['rating' => number_format($result, 2)];
            }
            $status = '00';
        }
        return $this->utility->response($status, $response);
    }

    public function calculateAvgRating ($rating) {
        $total = 0;
        foreach ($rating as $key => $value) {
            $total += $value->rating;
        }
        $rating = $total/count($rating);
        return $rating;
    }
}
