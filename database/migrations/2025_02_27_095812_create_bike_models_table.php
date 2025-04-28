<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('bike_models', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('brand_id');
            $table->string('name');
            $table->bigInteger('manufacture_year')->nullable();
            $table->bigInteger('engine_capacity')->nullable();
            $table->tinyInteger('status')->default(1)->comment('1=active, 0=inactive');
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('bike_models');
    }
};
