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
            $table->integer('item_id')->nullable();
            $table->date('date');
            $table->double('unit_price',20,2);
            $table->double('purchase_price',20,2)->nullable();
            $table->double('profit',20,2)->nullable();
            $table->double('net_sale_price',20,2)->nullable();
            $table->double('net_profit',20,2)->nullable();
            $table->tinyInteger('is_service_generated')->default(0)->comment('0=No, 1=Yes');
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('sale_details');
    }
};
