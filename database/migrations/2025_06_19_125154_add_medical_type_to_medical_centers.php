<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('medical_centers', function (Blueprint $table) {
            $table->tinyInteger('medical_type')->default(0)->comment('0=fake, 1=real')->after('id');
            $table->string('address')->nullable(0)->after('code');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('medical_centers', function (Blueprint $table) {
            //
        });
    }
};
