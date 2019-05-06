<?php

use App\Models\FlatPart;
use Faker\Generator as Faker;

$factory->define(FlatPart::class, function (Faker $faker) {
    return [
        'name' => $faker->words(2, true),
    ];
});
