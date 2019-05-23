<?php

use App\Models\FlatType;
use Illuminate\Database\Seeder;

class FlatTypesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(FlatType::class, 5)->create();
    }
}
