<?php

use App\Models\FlatType;
use Faker\Generator as Faker;

$factory->define(FlatType::class, function (Faker $faker) {
    return [
        'name' => $faker->words(2, true),
    ];
});
