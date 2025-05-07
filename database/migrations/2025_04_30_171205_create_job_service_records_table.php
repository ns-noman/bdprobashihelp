<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('job_service_records', function (Blueprint $table) {
            $table->id();
            $table->integer('job_id');
            $table->integer('item_id');
            $table->date('entry_date')->nullable();
            $table->date('expire_date')->nullable();
            $table->string('remarks')->nullable();
            $table->string('medical_centers')->nullable();
            $table->tinyInteger('is_enabled')->default(0);
            $table->tinyInteger('is_agent_purchased')->default(0);
            $table->integer('status_id');
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('job_service_records');
    }
};
