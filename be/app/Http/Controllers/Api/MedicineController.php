<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Medicine;

class MedicineController extends Controller
{
    public function index ()
    {
        $medicines = Medicine::all();
        return response()->json($medicines);
    }

    public function show (Medicine $medicine)
    {
        return response()->json($medicine);
    }

    public function store (Request $request)
    {
        $validatedData = $request->validate([ 
            'name'            => 'required|string',
            'type'            => 'required|string',
            'stock'            => 'required|integer',
            'patient_id' => 'required|exists:patients,id',
        ]);

        $medicine = Medicine::create($validatedData);
        return response()->json($medicine, 201);
    }

    //Post Multiple Medicine Data in One Click
    public function multipleMedicine(Request $request)
    {
        $data = $request->all();
        foreach ($data as $entry) {
            Medicine::create($entry); 
        }
        return response()->json(['message' => 'Data saved successfully'], 201);
    }

    public function update (Request $request, Medicine $medicine)
    {
        $validatedData = $request->validate([ 
            'name'            => 'required|string',
            'type'            => 'required|string',
            'stock'            => 'required|integer',
            'patient_id' => 'required|exists:patients,id',
        ]);

        $medicine->update($validatedData);
        return response()->json($medicine, 200);
    }

    public function destroy (Medicine $medicine)
    {
        $medicine->delete();
        return response()->json([ 'message' => 'Medicine deleted successfully' ]);
    }
}
