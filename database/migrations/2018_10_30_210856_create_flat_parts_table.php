<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFlatPartsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('flat_parts', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('flat_type_id');
            $table->string('name');
            $table->timestamps();

            $table->foreign('flat_type_id')
                ->references('id')
                ->on('flat_types');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('flat_parts');
    }
}
