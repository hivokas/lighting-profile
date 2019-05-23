<?php

use App\Models\Flat;
use Faker\Generator as Faker;

$factory->define(Flat::class, function (Faker $faker) {
    return [
        'name' => $faker->words(2, true),
    ];
});
