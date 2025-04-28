<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('admins', function (Blueprint $table) {
            $table->id();
            $table->string('name',50);
            $table->string('username',30)->nullable();
            $table->integer('agent_id',30)->nullable();
            $table->integer('type');
            $table->string('mobile');
            $table->string('email')->unique();
            $table->string('password');
            $table->string('image',100)->nullable();
            $table->tinyInteger('status');
            $table->timestamps();
            $table->rememberToken();
        });
    }
    public function down()
    {
        Schema::dropIfExists('admins');
    }
};
