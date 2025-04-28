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
            $table->integer('item_type')->comment('0=item, 1=service');
            $table->integer('item_id')->nullable();
            $table->integer('service_id')->nullable();
            $table->double('quantity',20,2);
            $table->double('unit_price',20,2);
            $table->double('purchase_price',20,2)->nullable();
            $table->double('profit',20,2)->nullable();
            $table->double('net_sale_price',20,2)->nullable();
            $table->double('net_profit',20,2)->nullable();
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('sale_details');
    }
};
