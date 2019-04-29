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

Route::get('brightness-value', function () {
    $flatPartUser = \App\Models\FlatPartUser::query()
        ->where('is_default', true)
        ->first();

    return $flatPartUser->brightness_percentage ?? 0;
});

Route::get('iot', function () {
    $flatPartUser = \App\Models\FlatPartUser::query()
        ->where('is_default', true)
        ->first();

    $brightness = round(($flatPartUser->brightness_percentage ?? 0) * 10.24);

    $color = $flatPartUser->color ?? '#FFFFFF';

    $colorObject = (new \OzdemirBurak\Iris\Color\Hex($color))
        ->toRgba()
        ->darken(50 - ($flatPartUser->brightness_percentage / 2))
//        ->brighten()
//        ->alpha( 1-$flatPartUser->brightness_percentage / 100)
        ->toHex();

    return substr((string) $colorObject, 1);

//    $color = str_replace('#', '', $color);
//
//    if (request()->has('json')) {
//        return [
//            'brightness' => $brightness,
//            'color_hex' => $color,
//            'color_16bit' => hexdec($color),
//        ];
//    }
//
//    $brightnessCoefficient = $flatPartUser->brightness_percentage / 100;
//
//    return $color;
//
//
//    $colorWithBrightness = str_pad(dechex(hexdec(substr($color, 0, 2)) * $brightnessCoefficient), 2, '0', STR_PAD_BOTH)
//        .''.str_pad(dechex(hexdec(substr($color, 2, 2)) * $brightnessCoefficient), 2, '0', STR_PAD_BOTH)
//        .''.str_pad(dechex(hexdec(substr($color, 4, 2)) * $brightnessCoefficient), 2, '0', STR_PAD_BOTH);
//
//    return $colorWithBrightness;
//
////    return $color;
});


Route::view('{any}', 'main')
    ->where('any', '.*');
