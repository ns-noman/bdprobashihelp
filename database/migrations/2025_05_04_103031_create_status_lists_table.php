<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('status_lists', function (Blueprint $table) {
            $table->id();
            $table->integer('item_id');
            $table->integer('srl')->default(0);
            $table->string('name');
            $table->string('color_code');
            $table->tinyInteger('status_state')->default(0)->comment('0=Initial State, 1=Middle State, 2=Final State');
            $table->tinyInteger('status')->default(0)->comment('0=Inactive, 1=Active');
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('status_lists');
    }
};
