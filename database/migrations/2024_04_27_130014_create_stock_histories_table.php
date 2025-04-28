<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('stock_histories', function (Blueprint $table) {
            $table->id();
            $table->integer('item_id');
            $table->date('date');
            $table->string('particular')->nullable();
            $table->double('stock_in_qty',20,2)->nullable();
            $table->double('stock_out_qty',20,2)->nullable();
            $table->double('rate',20,2)->default(0.00);
            $table->double('current_stock',20,2)->default(0.00);
            $table->integer('created_by_id');
            $table->timestamps();
        });
    }
    public function down(): void
    {
        Schema::dropIfExists('stock_histories');
    }
};
