<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('atendimentos', function (Blueprint $table) {
            $table->id();
            $table->integer('sintomas');
            $table->text('lista');
            $table->tinyinteger('resultado');
            $table->integer('idPaciente');
            $table->text('_token')->nullable(true);
            $table->timestamp('updated_at')->useCurrent()->nullable(true);
            $table->timestamp('created_at')->useCurrent()->nullable(true);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('atendimentos');
    }
};
