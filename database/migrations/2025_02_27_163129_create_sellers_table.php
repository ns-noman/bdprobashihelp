<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('sellers', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('contact')->nullable();
            $table->string('nid')->nullable();
            $table->date('dob')->nullable();
            $table->string('dl_no')->nullable();
            $table->string('passport_no')->nullable();
            $table->string('bcn_no')->nullable();
            $table->tinyInteger('seller_type')->default(0)->comment('0=general seller, 1=broker');
            $table->unsignedTinyInteger('status')->default(1)->comment('0=inactive, 1=active');
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('sellers');
    }
};
