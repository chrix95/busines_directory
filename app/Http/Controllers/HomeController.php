<?php

namespace App\Http\Controllers;

use App\Category;
use App\Business;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index ()
    {
        return view('home');
    }

    public function categoryindex () {
        $category = Category::all();
        return view('pages.category', compact('category'));
    }
    
    public function businessindex () {
        $business = Business::all();
        $category = Category::all();
        return view('pages.business', compact('business', 'category'));
    }

    public function businessview ($id) {
        $listing = Business::find($id);
        if(!$listing) {
            abort('404');
        }
        return view('pages.listing', compact('listing'));
    }

}
