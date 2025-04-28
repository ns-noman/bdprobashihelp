<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('bike_sales', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('bike_purchase_id');
            $table->bigInteger('account_id');
            $table->bigInteger('buyer_id');
            $table->decimal('sale_price', 20,2)->default(0.00);
            $table->date('sale_date');
            $table->string('doc_nid')->nullable();
            $table->string('doc_reg_card')->nullable();
            $table->string('doc_image')->nullable();
            $table->string('doc_deed')->nullable();
            $table->text('note')->nullable();
            $table->string('reference_number')->nullable();
            $table->date('name_transfer_date')->nullable();
            $table->tinyInteger('is_name_transfered')->default(0)->comment('0=Pending, 1=Transfered');
            $table->tinyInteger('is_repurchased')->default(0)->comment('0=repurchase, 1=repurchased');
            $table->tinyInteger('status')->default(0)->comment('0=Pending, 1=Approved');
            $table->bigInteger('created_by_id')->nullable();
            $table->bigInteger('updated_by_id')->nullable();
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('bike_sales');
    }
};
