<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('basic_infos', function (Blueprint $table) {

            $table->id();
            $table->string('title');
            $table->text('meta_keywords')->nullable();
            $table->longText('meta_description')->nullable();

            $table->string('logo');
            $table->string('favicon');

            $table->string('phone');
            $table->string('telephone')->nullable();
            $table->string('fax')->nullable();
            $table->string('email');
            $table->text('location');
            $table->text('address');

            //social
            $table->text('web_link')->nullable();
            $table->text('facebook_link')->nullable();
            $table->text('twitter_link')->nullable();
            $table->text('linkedin_link')->nullable();
            $table->text('youtube_link')->nullable();

            //short info
            $table->integer('assets_value');
            $table->integer('total_employees');
            $table->integer('total_companies');
            $table->integer('start_year');

            //embed links
            $table->longText('map_embed');
            $table->longText('video_embed_1');
            $table->longText('video_embed_2');
            $table->longText('video_embed_3');
            
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('basic_infos');
    }
};
