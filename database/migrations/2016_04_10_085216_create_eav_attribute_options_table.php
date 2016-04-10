<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEavAttributeOptionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create(eav_table('attribute_options'), function (Blueprint $table) {
            $table->increments('id');
            $table->integer('attribute_id')->unsigned();
            $table->string('label');
            $table->timestamps();

            $table->foreign('attribute_id')
                  ->references('id')
                  ->on('eav_attributes')
                  ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop(eav_table('attribute_options'));
    }
}
