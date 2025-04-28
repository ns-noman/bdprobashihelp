<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('supplier_payments', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('supplier_id');
            $table->bigInteger('account_id');
            $table->bigInteger('purchase_id')->nullable();
            $table->date('date');
            $table->double('amount',20,2);
            $table->string('reference_number')->nullable();
            $table->text('note')->nullable();
            $table->tinyInteger('status')->default(0)->comment('0=Pending, 1=Approved');
            $table->integer('created_by_id')->nullable();
            $table->integer('updated_by_id')->nullable();
            $table->timestamps();
        });
    }
    public function down(): void
    {
        Schema::dropIfExists('supplier_payments');
    }
};
