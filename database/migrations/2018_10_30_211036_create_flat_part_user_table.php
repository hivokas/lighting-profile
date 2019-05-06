<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFlatPartUserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('flat_part_user', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('flat_part_id');
            $table->unsignedInteger('user_id');

            $table->unsignedInteger('brightness_percentage')->default(100);
            $table->boolean('reacts_to_movements')->default(true);
            $table->unsignedInteger('turn_off_timer')->default(3600);

            $table->unique(['flat_part_id', 'user_id']);

            $table->foreign('flat_part_id')
                ->references('id')
                ->on('flat_parts');
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
        Schema::dropIfExists('flat_part_user');
    }
}
