<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('bike_service_record_details', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('bike_service_record_id');
            $table->bigInteger('service_id');
            $table->integer('quantity');
            $table->decimal('price',20,2);
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('bike_service_record_details');
    }
};
