<?php

namespace App\Http\Controllers;

use App\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
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
        $category = Category::all();
        return $this->utility->response($status, $category);
    }
    /**
     * Get a category
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function show ($id)
    {
        $status = '00';
        $category = Category::find($id);
        if (!$category) {
            $status = '06';
            $category = [];
        }
        return $this->utility->response($status, $category);
    }

    public function store (Request $request) {
        $data = array(
            'name'      =>  $request->name
        );
        // hash the user vendor_id as security pass
        $validator = \Validator::make($data, [
            'name'      =>  'required|string|max:191|unique:categories'
        ]);
        if($validator->fails()) {
            $status = '05';
            $response = $validator->errors();
        } else {
            $response = Category::create($data);
            $status = '02';
        }
        return $this->utility->response($status, $response);
    }

    public function update (Request $request, $id) {
        $category = Category::find($id);
        if (!$category) {
            $status = '06';
            $response = [];
        } else {
            $data = array(
                'name'      =>  $request->name
            );
            // hash the user vendor_id as security pass
            $validator = \Validator::make($data, [
                'name'      =>  'string|max:191'
            ]);
            if($validator->fails()) {
                $status = '05';
                $response = $validator->errors();
            } else {
                if ($this->utility->uniqueCategory($data['name'])) {
                    $status = '00';
                    $category->update($data);
                    $data['id'] = $id;
                    $response = $data;
                } else {
                    $status = '01';
                    $response = [];
                }
            }
        }
        return $this->utility->response($status, $response);
    }

    public function destroy ($id) {
        $category = Category::find($id);
        if (!$category) {
            $status = '06';
            $response = [];
        } else {            
            $status = '07';
            $category->delete();
            $response = [];
        }
        return $this->utility->response($status, $response);
    }
}
