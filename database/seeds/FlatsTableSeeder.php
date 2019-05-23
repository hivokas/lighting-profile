<?php

use App\Models\Flat;
use App\Models\FlatType;
use App\Models\User;
use Illuminate\Database\Seeder;

class FlatsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $flatTypes = FlatType::all();
        $users = User::all();

        collect(factory(Flat::class, 50)->make())
            ->each(function (Flat $flat) use ($flatTypes, $users) {
                $flat->flatType()->associate($flatTypes->random());
                $flat->user()->associate($users->random());

                $flat->save();
            });
    }
}
