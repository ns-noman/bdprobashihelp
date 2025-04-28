<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('party_payments', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('party_id');
            $table->bigInteger('account_id');
            $table->tinyInteger('payment_type')->comment('0=paid to party, 1=collection from party');
            $table->bigInteger('loan_id')->nullable();
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
    public function down()
    {
        Schema::dropIfExists('party_payments');
    }
};
