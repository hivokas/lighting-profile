<?php

use App\Models\FlatType;
use App\Models\FlatPart;
use Illuminate\Database\Seeder;

class FlatPartsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        FlatType::all()->each(function (FlatType $flatType) {
            $flatType->flatParts()->saveMany(
                factory(FlatPart::class, rand(4, 6))->make()
            );
        });
    }
}
