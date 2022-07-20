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
        Schema::create('pacientes', function (Blueprint $table) {
            $table->id();
            $table->string('nome',255);
            $table->date('nasc');
            $table->string('cpf',11);
            $table->string('wpp',11);
            $table->string('foto',17)->default('none.jpg');
            $table->tinyinteger('estado')->default(3);
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
        Schema::dropIfExists('pacientes');
    }
};
