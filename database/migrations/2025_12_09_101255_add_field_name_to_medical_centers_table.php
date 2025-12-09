<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{

    public function up()
    {
        Schema::table('medical_centers', function (Blueprint $table) {
            $table->integer('parent_id')->default(null)->nullable()->after('id');
        });
    }

    public function down()
    {
        Schema::table('medical_centers', function (Blueprint $table) {
            $table->dropColumn('parent_id');
        });
    }
};
