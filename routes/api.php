<?php

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

Route::namespace('Auth')->name('auth.')->group(function () {
    Route::post('login', 'LoginController@login')->name('login');

    Route::post('register', 'RegisterController@register')->name('register');

    Route::post('password/email', 'ForgotPasswordController@sendResetLinkEmail')->name('password.sendResetLinkEmail');

    Route::post('password/reset', 'ResetPasswordController@reset')->name('password.reset');
});

Route::namespace('Me')->name('me.')->prefix('me')->group(function () {
    Route::get('account', 'AccountController@show')->name('account.show');
    Route::put('/account', 'AccountController@update')->name('account.update');

    Route::put('/password', 'PasswordController@update')->name('password.update');

    Route::apiResource('flat-types', 'FlatTypeController')
        ->only(['index', 'update', 'destroy']);

    Route::apiResource('flat-parts', 'FlatPartController')
        ->only(['index', 'update', 'destroy']);
});

Route::apiResource('flat-types', 'FlatTypeController')
    ->only(['index', 'show']);