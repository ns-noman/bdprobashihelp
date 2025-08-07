<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('job_service_records', function (Blueprint $table) {
            $table->tinyInteger('is_active')->default(0)->comment('0=No, 1=Yes')->after('is_enabled');
        });
    }

    public function down()
    {
        Schema::table('job_service_records', function (Blueprint $table) {
            $table->dropColumn('is_active');
        });
    }
};
