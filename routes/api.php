<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'v1'], function() {
    Route::group(['prefix' => 'category'], function() {
        Route::get('/', 'CategoryController@index');
        Route::get('/{id}', 'CategoryController@show');
        Route::post('/', 'CategoryController@store');
        Route::put('/{id}', 'CategoryController@update');
        Route::delete('/{id}', 'CategoryController@destroy');
    });
    Route::group(['prefix' => 'business'], function() {
        Route::get('/', 'BusinessController@index');
        Route::get('/{id}', 'BusinessController@show');
        Route::post('/', 'BusinessController@store');
        Route::post('/{id}', 'BusinessController@update');
        Route::get('/status/{id}/{value}', 'BusinessController@changeStatus');
        Route::get('/rating/{id}/{value}', 'BusinessController@updateRating');
        Route::post('/upload/{id}', 'BusinessController@uploadImage');
        Route::delete('/{id}', 'BusinessController@destroy');
    });
});
