<?php

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

use Illuminate\Support\Facades\Route;


Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/bunch/{id}', 'HomeController@bunch')->name('bunch');
Route::get('/deletebunch/{id}', 'HomeController@delete')->name('deletebunch');
Route::get('/fullbunch', 'HomeController@fullbunch')->name('fullBanner');

Route::get('/manager/banner', 'ManagerController@index')->name('managerBanner');
Route::get('/admin/users', 'UsersController@index')->name('fullUsers');
Route::get('/admin/delete/{id}', 'UsersController@userDelete')->name('deleteUsers');


Route::group(['middleware' => 'ajax'], function () {
    Route::any('/admin/controlUser', 'UsersController@controlUser')->name('controlUser');
    Route::any('/add', 'AjaxController@add')->name('add');
    Route::any('/deleteBanner', 'AjaxController@delete')->name('deleteBanner');
    Route::any('/editing', 'AjaxController@editing')->name('editing');
    Route::any('/connection', 'AjaxController@index')->name('connections');
    Route::any('/admin/deleteRole', 'UsersController@deleteRole')->name('deleteRoles');
    Route::any('/admin/addRole', 'UsersController@addRole')->name('addRoles');

});

Route::post('/FileUpload', 'FileController@fileupload')->name('upload');
Route::post('/FileUpdate', 'FileController@fileupdate')->name('update');


