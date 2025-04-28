<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('party_loans', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('party_id');
            $table->unsignedBigInteger('account_id')->nullable();
            $table->string('loan_no')->unique();
            $table->tinyInteger('loan_type')->comment('0 = loan_given, 1 = loan_taken');
            $table->double('amount', 20, 2);
            $table->date('loan_date')->nullable();
            $table->date('due_date')->nullable();
            $table->date('last_payment_date')->nullable();
            $table->double('paid_amount', 20, 2)->default(0);
            $table->string('reference_number')->nullable();
            $table->tinyInteger('payment_status')->default(0)->comment('0 = pending, -1 = partial, 1 = paid');
            $table->text('note')->nullable();
            $table->tinyInteger('status')->default(0)->comment('0=Pending, 1=Approved');
            $table->unsignedInteger('created_by_id')->nullable();
            $table->unsignedInteger('updated_by_id')->nullable();
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('party_loans');
    }
};
