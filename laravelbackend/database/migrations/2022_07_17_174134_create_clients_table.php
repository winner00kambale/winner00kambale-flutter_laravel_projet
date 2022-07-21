<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateClientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('clients', function (Blueprint $table) {
            $table->increments('id');
            $table->string('noms');
            $table->string('genre');
            $table->string('profession');
            $table->string('etatcivil');
            $table->string('type_piece');
            $table->string('numero_piece');
            $table->string('adresse');
            $table->string('contact');
            $table->string('mail');
            $table->string('montant_compte');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('clients');
    }
}
