<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('bike_purchases', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('investor_id');
            $table->bigInteger('bike_id');
            $table->bigInteger('account_id');
            $table->bigInteger('seller_id');
            $table->bigInteger('broker_id')->nullable();
            $table->bigInteger('bike_sale_id')->nullable()->comment('Need in repurchase');
            $table->decimal('purchase_price', 20,2)->default(0.00);
            $table->decimal('servicing_cost', 20,2)->default(0.00);
            $table->decimal('total_cost', 20,2)->default(0.00);
            $table->date('purchase_date');
            $table->string('doc_nid')->nullable();
            $table->string('doc_reg_card')->nullable();
            $table->string('doc_image')->nullable();
            $table->string('doc_deed')->nullable();
            $table->text('note')->nullable();
            $table->string('reference_number')->nullable();
            $table->tinyInteger('purchase_status')->default(0)->comment('0=Pending, 1=Approved');
            $table->tinyInteger('selling_status')->default(0)->comment('0=Unsold, 1=Sold');
            $table->bigInteger('created_by_id')->nullable();
            $table->bigInteger('updated_by_id')->nullable();
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('bike_purchases');
    }
};
