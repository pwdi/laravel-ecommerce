<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

// Event::listen('illuminate.query', function($query)
// {
//     var_dump($query);
// });

Route::get('/', ['as' => 'categories.index', 'uses' => 'CategoriesController@index']);
Route::resource('categories', 'CategoriesController', ['only' => ['show']]);
Route::resource('products', 'ProductsController', ['only' => ['show']]);
