<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Temperature;

class TemperatureController extends Controller
{
    /**
     * Menampilkan seluruh data pada Tabel Temperature.
     */
    public function index()
    {
        $allDataTemperature = Temperature::all();
        return response()->json($allDataTemperature);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Input data ke Table Temperature.
     */
    public function store(Request $request)
    {
        $createTemperatureData = Temperature::create([
            'patient_id' => $request->patientId,
            'patient_temp' => $request->patientTemp,
        ]);

        return response()->json(
            [
                "message" => "Success",
                "data" => $createTemperatureData
            ]
        );
    }

    //Post Multiple Temperature Data
    public function multipleTempInput(Request $request)
    {
        $data = $request->all();
        foreach ($data as $entry) {
            Temperature::create($entry); // Save the data to the database using Eloquent
        }
        return response()->json(['message' => 'Patient Temperature Data saved successfully']);
    }

    /**
     * Lihat data Temperature berdasarkan ID yang diinputkan.
     */
    public function show(string $id)
    {
        $detailTemperatureData = Temperature::find($id);
        if (!$detailTemperatureData) {
            return response()->json(['message' => 'Temperature data not found'], 404);
        }
        return response()->json($detailTemperatureData);
    }

    //Get 20 Data Temp Terakhir
    public function last20DataTemp()
    {
        $last20Temp = Temperature::latest()->limit(20)->get();
        return response()->json($last20Temp);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
