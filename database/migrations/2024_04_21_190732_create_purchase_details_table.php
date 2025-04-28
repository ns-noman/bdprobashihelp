<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('purchase_details', function (Blueprint $table) {
            $table->id();
            $table->integer('purchase_id');
            $table->integer('item_id');
            $table->decimal('quantity',20,2);
            $table->decimal('unit_price',20,2);
            $table->timestamps();
        });
    }
    public function down(): void
    {
        Schema::dropIfExists('purchase_details');
    }
};
