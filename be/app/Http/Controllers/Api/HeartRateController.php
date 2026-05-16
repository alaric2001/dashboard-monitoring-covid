<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\HeartRate;

class HeartRateController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $allDataHr = HeartRate::all();
        return response()->json($allDataHr);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $createHeartBeatData = HeartRate::create([
            'patient_id' => $request->patientId,
            'heart_beats' => $request->beats,
        ]);

        return response()->json(
            [
                "message" => "Success",
                "data" => $createHeartBeatData
            ]
        );
    }

    //Post Multiple HR Data
    public function multipleHR(Request $request)
    {
        $data = $request->all();
        foreach ($data as $entry) {
            HeartRate::create($entry); // Save the data to the database using Eloquent
        }
        return response()->json(['message' => 'Data saved successfully']);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $detailHeartBeatsData = HeartRate::find($id);
        if (!$detailHeartBeatsData) {
            return response()->json(['message' => 'Heart Beats Data not found'], 404);
        }
        return response()->json($detailHeartBeatsData);
    }

    //Get 20 Data Hr Terakhir
    public function last20DataHr()
    {
    $last20Hr = HeartRate::latest()->limit(20)->get();
    return response()->json($last20Hr);
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
