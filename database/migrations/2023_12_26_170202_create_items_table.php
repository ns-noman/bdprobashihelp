<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('items', function (Blueprint $table) {
            $table->id();
            $table->tinyInteger('item_type')->nullable()->comment('0=Item, 1=Package');
            $table->integer('package_id')->nullable();
            $table->integer('package_item_id')->nullable();
            $table->integer('srl')->nullable();
            $table->string('name');
            $table->longText('description')->nullable();
            $table->double('purchase_price',20,2)->default(0.00);
			$table->double('sale_price',20,2)->default(0.00);
			$table->double('vat',20,2)->default(0.00);
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('items');
    }
};
