<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('buyers', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('contact')->nullable();
            $table->string('nid')->nullable();
            $table->date('dob')->nullable();
            $table->string('dl_no')->nullable();
            $table->string('passport_no')->nullable();
            $table->string('bcn_no')->nullable();
            $table->unsignedTinyInteger('status')->default(1)->comment('0=Inactive, 1=Active');
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('buyers');
    }
};
