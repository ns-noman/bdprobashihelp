<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('purchases', function (Blueprint $table) {
            $table->id();
            $table->integer('supplier_id');
            $table->bigInteger('account_id')->nullable();
            $table->string('vouchar_no');
            $table->date('date');
            $table->double('total_price',20,2);
            $table->double('vat_tax',20,2)->nullable()->default(0.00);
            $table->tinyInteger('discount_method')->default(1)->comment('0=Percentage, 1=Solid');
            $table->double('discount_rate',20,2);
            $table->double('discount',20,2);
            $table->double('total_payable',20,2);
            $table->double('paid_amount',20,2);
            $table->string('reference_number')->nullable();
            $table->text('note')->nullable();
            $table->string('payment_status')->default(0);
            $table->string('status')->default(1);
            $table->integer('created_by_id')->nullable();
            $table->integer('updated_by_id')->nullable();
            $table->timestamps();
        });
    }
    public function down(): void
    {
        Schema::dropIfExists('purchases');
    }
};
