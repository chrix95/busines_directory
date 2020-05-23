<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'WelcomeController@index')->name('welcome');
Route::get('/listing/view/{id}', 'WelcomeController@viewListing')->name('view.listing');

Auth::routes(['register' => false]);

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/category', 'HomeController@categoryindex')->name('category.index');
Route::get('/business', 'HomeController@businessindex')->name('business.index');
Route::get('/business/search', 'BusinessController@search')->name('business.search');
Route::get('/business/view/{id}', 'HomeController@businessview')->name('business.view');
Route::get('/business/view/{id}', 'HomeController@businessview')->name('business.view');

// api endpoints for the frontend
// Route::group(['prefix' => 'api/v1', 'middleware' => ['auth']], function() {
// Route::group(['prefix' => 'api/v1'], function() {
//     Route::group(['prefix' => 'category'], function() {
//         Route::get('/', 'CategoryController@index');
//         Route::post('/', 'CategoryController@store');
//     });
// });