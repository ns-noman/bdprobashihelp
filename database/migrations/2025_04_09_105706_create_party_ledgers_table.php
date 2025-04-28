<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('party_ledgers', function (Blueprint $table) {
            $table->id();
            $table->integer('party_id');
            $table->integer('loan_id')->nullable();
            $table->tinyInteger('loan_type')->comment('0 = loan_given, 1 = loan_taken');
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
    public function down()
    {
        Schema::dropIfExists('party_ledgers');
    }
};
