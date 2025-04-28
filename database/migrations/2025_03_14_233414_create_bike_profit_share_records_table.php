<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('bike_profit_share_records', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('bike_profit_id');
            $table->bigInteger('account_id');
            $table->decimal('amount', 20,2)->default(0.00);
            $table->date('date');
            $table->text('note')->nullable();
            $table->string('reference_number')->nullable();
            $table->tinyInteger('status')->default(0)->comment('0=Pending, 1=Approved');
            $table->bigInteger('created_by_id')->nullable();
            $table->bigInteger('updated_by_id')->nullable();
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('bike_profit_share_records');
    }
};
