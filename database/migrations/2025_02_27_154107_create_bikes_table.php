<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('bikes', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('model_id');
            $table->bigInteger('color_id');
            $table->string('registration_no')->unique(); 
            $table->string('chassis_no')->unique(); 
            $table->string('engine_no')->unique();
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('bikes');
    }
};
