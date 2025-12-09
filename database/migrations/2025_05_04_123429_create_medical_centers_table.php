<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('medical_centers', function (Blueprint $table) {
            $table->id();
            $table->integer('parent_id')->default(null)->nullable();
            $table->string('name');
            $table->string('code');
            $table->string('address')->nullable();
            $table->tinyInteger('status')->default(0)->comment('0=Inactive, 1=Active');
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('medical_centers');
    }
};
