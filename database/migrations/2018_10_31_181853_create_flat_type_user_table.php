<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFlatTypeUserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('flat_type_user', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('flat_type_id');
            $table->unsignedInteger('user_id');

            $table->unique(['flat_type_id', 'user_id']);


            $table->foreign('flat_type_id')
                ->references('id')
                ->on('flat_types');
            $table->foreign('user_id')
                ->references('id')
                ->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('flat_type_user');
    }
}
