<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('account_ledgers', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('account_id');
            $table->double('debit_amount', 20, 2)->nullable()->comment('Withdrawal');
            $table->double('credit_amount', 20, 2)->nullable()->comment('Deposit');
            $table->double('current_balance', 20, 2);
            $table->string('reference_number')->nullable();
            $table->text('description')->nullable();
            $table->timestamp('transaction_date')->useCurrent();
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('account_ledgers');
    }
};
