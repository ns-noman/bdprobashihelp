<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('sale_details', function (Blueprint $table) {
            $table->id();
            $table->integer('sale_id');
            $table->integer('item_id');
            $table->date('date');
            $table->double('purchase_price',20,2)->nullable();
            $table->double('sale_price',20,2)->nullable();
            $table->double('profit',20,2)->nullable();
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('sale_details');
    }
};
