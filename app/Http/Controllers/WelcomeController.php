<?php

namespace App\Http\Controllers;

use App\Business;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class WelcomeController extends Controller
{
    
    public function index ()
    {
        $status = '00';
        $directory = Business::orderBy('rating', 'desc')->orderBy('views', 'desc')->get();
        return view('welcome', compact('directory'));
    }

    public function viewListing ($id) {
        $business = Business::find($id);
        if (!$business) {
            abort(404);
        }
        return view('viewlisting', compact('business'));
    }

}
