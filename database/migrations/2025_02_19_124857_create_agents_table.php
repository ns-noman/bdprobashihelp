<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('agents', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email');
            $table->string('contact');
            $table->string('address')->nullable();
            $table->date('dob');
            $table->bigInteger('nid');
            $table->decimal('balance',20,2)->default(0.00);
            $table->unsignedTinyInteger('is_self')->default(0)->comment('0=Not Self, 1=Self');
            $table->tinyInteger('status')->default(1)->comment('1=active, 0=inactive');
            $table->bigInteger('created_by_id')->nullable();
            $table->bigInteger('updated_by_id')->nullable();
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('agents');
    }
};
