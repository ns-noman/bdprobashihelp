<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('sales', function (Blueprint $table) {
            $table->id();
            $table->integer('agent_id');
            $table->bigInteger('account_id')->nullable();
            $table->string('passenger_name');
            $table->string('passenger_passport_no');
            $table->string('invoice_no');
            $table->date('date');
            $table->double('total_price',20,2);
            $table->double('paid_amount',20,2);
            $table->string('reference_number')->nullable();
            $table->text('note')->nullable();
            $table->tinyInteger('payment_status')->default(0)->comment('0 = pending, -1 = partial, 1 = paid');
            $table->tinyInteger('status')->default(0)->comment('0=Pending, 1=Approved');
            $table->integer('created_by_id')->nullable();
            $table->integer('updated_by_id')->nullable();
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('sales');
    }
};
