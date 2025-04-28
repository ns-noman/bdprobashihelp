<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('menus', function (Blueprint $table) {
            $table->id();
            $table->integer('parent_id')->default(0);
            $table->integer('srln')->default(1);
            $table->string('menu_name');
            $table->string('navicon')->nullable();
            $table->tinyInteger('is_side_menu')->default(0);
            $table->tinyInteger('create_route')->nullable();
            $table->string('route')->nullable();
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('menus');
    }
};
