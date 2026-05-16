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
        Schema::create('patients', function (Blueprint $table) {
            $table->id();
            $table->string('patient_name');
            $table->date('admission_date');
            $table->date('discharge_date')->nullable();
            $table->string('gender');
            $table->date('birth')->nullable();
            $table->string('id_card')->nullable();
            $table->text('address')->nullable();
            $table->string('contact')->nullable();
            $table->string('education')->nullable();
            $table->string('occupation')->nullable();
            $table->string('photo')->nullable();
            $table->string('referred')->nullable();
            $table->string('next_of_kin_name')->nullable();
            $table->string('relationship')->nullable();
            $table->longText('next_of_kin_address')->nullable();
            $table->string('next_of_kin_contact')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('patients');
    }
};
