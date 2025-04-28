<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up()
    {
        Schema::create('fund_transfer_histories', function (Blueprint $table) {
            $table->id();
            $table->date('transfer_date')->useCurrent();
            $table->unsignedBigInteger('from_account_id');
            $table->unsignedBigInteger('to_account_id');
            $table->double('amount', 20, 2);
            $table->string('reference_number')->nullable();
            $table->string('description')->nullable();
            $table->tinyInteger('status')->default(0)->comment('0=Pending, 1=Approved');
            $table->unsignedBigInteger('created_by_id')->nullable();
            $table->unsignedBigInteger('updated_by_id')->nullable();
            $table->timestamps();

        });
    }
    public function down()
    {
        Schema::dropIfExists('fund_transfer_histories');
    }
};
