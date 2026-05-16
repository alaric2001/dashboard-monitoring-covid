<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Nibp;

class NibpController extends Controller
{
    /**
     * Menampilkan seluruh data pada Tabel Nibp.
     */
    public function index()
    {
        $allDataNibp = Nibp::all();
        return response()->json($allDataNibp);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Input data ke Table Nibp.
     */
    public function store(Request $request)
    {
        $createNibpData = Nibp::create([
            'patient_id' => $request->patientId,
            'diastolic' => $request->diastolik,
            'systolic' => $request->sistolik,
        ]);

        return response()->json(
            [
                "message" => "Success",
                "data" => $createNibpData
            ]
        );
    }

    //Post Multiple Nibp Data
    public function multipleNibpInput(Request $request)
    {
        $data = $request->all();
        foreach ($data as $entry) {
            Nibp::create($entry); // Save the data to the database using Eloquent
        }
        return response()->json(['message' => 'Patient Nibp Data saved successfully']);
    }

    /**
     * Lihat data Nibp berdasarkan ID yang diinputkan.
     */
    public function show(string $id)
    {
        $detailNibpData = Nibp::find($id);
        if (!$detailNibpData) {
            return response()->json(['message' => 'Nibp data not found'], 404);
        }
        return response()->json($detailNibpData);
    }

    //Get 10 Data Nibp Terakhir
    public function last20DataNibp()
    {
        $last20Nibp = Nibp::latest()->limit(20)->get();
        return response()->json($last20Nibp);
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
