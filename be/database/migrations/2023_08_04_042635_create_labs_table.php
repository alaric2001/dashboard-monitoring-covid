<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('labs', function (Blueprint $table) {
            $table->id();
            $table->string('lab_name');
            $table->unsignedBigInteger('patient_id');
            $table->string('test_type');
            $table->string('result');
            $table->date('sample_collection_date')->nullable();
            $table->date('dispatch_to_lab_date')->nullable();
            $table->date('sample_received_date')->nullable();
            $table->date('processed_date')->nullable();
            $table->foreign('patient_id')->references('id')->on('patients')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('labs');
    }
};
