<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UtilityController extends Controller
{

    public function messageCode($value) {
        $code = array(
            "00"    =>  "Successful", //used
            "01"    =>  "Category must be unique",
            "02"    =>  "Created", // used
            "03"    =>  "Invalid Credentials",
            "04"    =>  "User not allowed. Contact Administrator for support",
            "05"    =>  "Validation Error", // used
            "06"    =>  "No Result found",
            "07"    =>  "Item has been Deleted",
            "08"    =>  "Invalid amount paid",
            "09"    =>  "Transaction reference not found",
            "10"    =>  "Service Unavailable"
        );
        return $code[$value];
    }

    public function headerCode($code) {
        $headerCode = array(
            "00"    =>  200,
            "01"    =>  422,
            "02"    =>  201,
            "03"    =>  401,
            "04"    =>  403,
            "05"    =>  406,
            "06"    =>  404,
            "07"    =>  200,
            "08"    =>  400,
            "09"    =>  404,
            "10"    =>  503
        );
        return $headerCode[$code];
    }

    public function response($status, $data = []) {
        $message = $this->messageCode($status); // get error code message
        $header_code = $this->headerCode($status); // get header code message
        $resp = array(
            'status'    =>  $status,
            'message'   =>  $message,
            'data'      =>  $data
        );
        return response()->json($resp, $header_code);
    }

    public function uniqueCategory ($name) {
        $category = \App\Category::where('name', $name)->first();
        if ($category) {
            return false;
        }
        return true;
    }

    public function uniqueBusiness ($name, $email) {
        $category = \App\Business::where('name', $name)->orWhere('email', $email)->get();
        if (count($category) > 1) {
            return false;
        }
        return true;
    }

}
