<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('supplier_ledgers', function (Blueprint $table) {
            $table->id();
            $table->integer('supplier_id');
            $table->integer('purchase_id')->nullable();
            $table->integer('payment_id')->nullable();
            $table->integer('account_id')->nullable();
            $table->string('particular')->nullable();
            $table->date('date');
            $table->decimal('debit_amount',20,2)->nullable();
            $table->decimal('credit_amount',20,2)->nullable();
            $table->decimal('current_balance',20,2);
            $table->text('reference_number')->nullable();
            $table->text('note')->nullable();
            $table->integer('created_by_id')->nullable();
            $table->integer('updated_by_id')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('supplier_ledgers');
    }
};
