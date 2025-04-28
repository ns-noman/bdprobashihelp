<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('accounts', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('payment_method_id');
            $table->string('account_no')->nullable();
            $table->string('holder_name')->nullable();
            $table->decimal('balance', 20,2)->default(0.00);
            $table->tinyInteger('status')->default(1)->comment('1=active, 0=inactive');
            $table->bigInteger('created_by_id')->nullable();
            $table->bigInteger('updated_by_id')->nullable();
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('accounts');
    }
};
