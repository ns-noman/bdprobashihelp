<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('bike_profits', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('bike_sale_id');
            $table->bigInteger('investor_id');
            $table->decimal('profit_amount', 20,2)->default(0.00);
            $table->decimal('profit_share_amount', 20,2)->nullable();
            $table->date('profit_entry_date');
            $table->date('profit_share_last_date')->nullable();
            $table->tinyInteger('status')->default(0)->comment('0=Open, 1=Closed');
            $table->bigInteger('created_by_id')->nullable();
            $table->bigInteger('updated_by_id')->nullable();
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('bike_profits');
    }
};
