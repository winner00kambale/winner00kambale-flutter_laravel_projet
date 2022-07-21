<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVoituresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('voitures', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('proprietaite_id')->unsigned();
            $table->integer('category_id')->unsigned();
            $table->string('marque');
            $table->string('couleur');
            $table->string('plaque');
            $table->integer('nombreplace');
            $table->timestamps();
            $table->foreign('proprietaite_id')->references('id')->on('proprietaires');
            $table->foreign('category_id')->references('id')->on('categories');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('voitures');
    }
}
