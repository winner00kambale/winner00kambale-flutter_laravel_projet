<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAffectationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('affectations', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('chauffeur_id')->unsigned();
            $table->integer('voiture_id')->unsigned();
            $table->date('dates');
            $table->timestamps();
            $table->foreign('chauffeur_id')->references('id')->on('chauffeurs');
            $table->foreign('voiture_id')->references('id')->on('voitures');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('affectations');
    }
}
