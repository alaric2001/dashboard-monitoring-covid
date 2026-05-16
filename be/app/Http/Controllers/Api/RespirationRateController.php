<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\RespirationRate;
use Carbon\Carbon;

class RespirationRateController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $allRr = RespirationRate::all();
        return response()->json($allRr);
        // return response()->json(
        //     [
        //         "message" => "GET Method Success",
        //         "data" => $allRr 
        //     ]
        // );
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
        $createRespiratoryData = RespirationRate::create([
            'patient_id' => $request->patientId,
            'breaths' => $request->breath,
        ]);
        
        return response()->json(
            [
                "message" => "Success",
                "data" => $createRespiratoryData
            ]
        );
    // // Get the current date and time in Jakarta timezone
    // $currentDateTimeJakarta = Carbon::now('Asia/Jakarta');

    // // Get the provided created_at value from the input data
    // $providedCreatedAt = $request->input('created_at');

    // // If the provided created_at value is empty or invalid, use the current date and time in Jakarta
    // $createdAt = $providedCreatedAt ? Carbon::parse($providedCreatedAt) : $currentDateTimeJakarta;

    // // Create the record with the specified created_at date and other data
    // $createRespiratoryData = RespirationRate::create([
    //     'patient_id' => $request->patientId,
    //     'breaths' => $request->breath,
    //     'created_at' => $createdAt, // Use the updated created_at value
    // ]);

    // return response()->json([
    //     "message" => "Success",
    //     "data" => $createRespiratoryData
    // ]);
    }

    //Post Multiple Data in One Click
    public function multipleRR(Request $request)
    {
        $data = $request->all();

        // Assuming the data is sent as an array of objects,
        // you can loop through the data and save each entry to the database.
        foreach ($data as $entry) {
            RespirationRate::create($entry); // Save the data to the database using Eloquent
        }
        return response()->json(['message' => 'Data saved successfully'], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $detailRespiratoryData = RespirationRate::find($id);
        if (!$detailRespiratoryData) {
            return response()->json(['message' => 'Respiration Rate not found'], 404);
        }
        return response()->json($detailRespiratoryData);
    }

    //Get 20 Data RR Terakhir
    public function last20DataRr()
    {
    $last20Rr = RespirationRate::latest()->limit(20)->get();
    return response()->json($last20Rr);
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
