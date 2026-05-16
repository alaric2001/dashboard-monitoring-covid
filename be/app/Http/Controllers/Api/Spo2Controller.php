<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Spo2;

class Spo2Controller extends Controller
{
    /**
     * Menampilkan seluruh data pada Tabel Spo2.
     */
    public function index()
    {
        $allDataSpo2 = Spo2::all();
        return response()->json($allDataSpo2);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Input data ke Table Spo2.
     */
    public function store(Request $request)
    {
        $createSpo2Data = Spo2::create([
            'patient_id' => $request->patientId,
            'blood_oxygen' => $request->oxygenInBlood,
        ]);
        // $validatedData = $request->validate([ 
        //     'blood_oxygen'  => 'required',
        //     'patient_id' => 'nullable|exists:patient_id',
        // ]);

        // $createSpo2Data = Spo2::create($validatedData);

        return response()->json(
            [
                "message" => "Success",
                "data" => $createSpo2Data
            ]
        );
    }

    //Post Multiple Spo2 Data
    public function multipleSpo2Input(Request $request)
    {
        $data = $request->all();
        foreach ($data as $entry) {
            Spo2::create($entry); // Save the data to the database using Eloquent
        }
        return response()->json(['message' => 'Data saved successfully']);
    }

    /**
     * Lihat data Spo2 berdasarkan ID yang diinputkan.
     */
    public function show(string $id)
    {
        $detailSpo2Data = Spo2::find($id);
        if (!$detailSpo2Data) {
            return response()->json(['message' => 'Spo2 Data not found'], 404);
        }
        return response()->json($detailSpo2Data);
    }

    //Get 20 Data Spo2 Terakhir
    public function last20DataSpo2()
    {
    $last20Spo2 = Spo2::latest()->limit(20)->get();
    return response()->json($last20Spo2);
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
