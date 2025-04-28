<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('bike_service_records', function (Blueprint $table) {
            $table->id();
            $table->string('invoice_no')->nullable();
            $table->bigInteger('bike_purchase_id')->nullable();
            $table->bigInteger('customer_id')->nullable();
            $table->bigInteger('account_id')->nullable();
            $table->date('date');
            $table->decimal('total_amount',20,2);
            $table->string('reference_number')->nullable();
            $table->date('note')->nullable();
            $table->unsignedTinyInteger('status')->default(1)->comment('0=Pending, 1=Approved');
            $table->bigInteger('created_by_id')->nullable();
            $table->bigInteger('updated_by_id')->nullable();
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('bike_service_records');
    }
};
