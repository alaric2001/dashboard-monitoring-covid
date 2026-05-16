<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Lab;
use Carbon\Carbon;

class LabController extends Controller
{
    public function index()
    {
        $labs = Lab::all();
        foreach ($labs as $item) {
            $item->sample_collection_date = Carbon::createFromFormat('Y-m-d', $item->sample_collection_date)->format('d/m/Y');
            $item->dispatch_to_lab_date = Carbon::createFromFormat('Y-m-d', $item->dispatch_to_lab_date)->format('d/m/Y');
            $item->processed_date = Carbon::createFromFormat('Y-m-d', $item->processed_date)->format('d/m/Y');
            $item->sample_received_date = Carbon::createFromFormat('Y-m-d', $item->sample_received_date)->format('d/m/Y');
        }
        return response()->json($labs);
    }
    public function show($id)
    {
        $lab = Lab::find($id);

        if (!$lab) {
            return response()->json(['message' => 'Lab record not found'], 404);
        }

        return response()->json($lab);
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'date' => 'required|date',
            'lab_name' => 'required',
            'patient_id' => 'required|exists:patients,id',
            'test_type' => 'required',
            'result' => 'required',
            'sample_collection_date' => 'nullable|date',
            'dispatch_to_lab_date' => 'nullable|date',
            'sample_received_date' => 'nullable|date',
            'processed_date' => 'nullable|date',
        ]);

        $lab = Lab::create($validatedData);

        return response()->json($lab, 201);
    }

    //Post Multiple Lab Data in One Click
    public function multipleLab(Request $request)
    {
        $data = $request->all();
        foreach ($data as $entry) {
            Lab::create($entry); 
        }
        return response()->json(['message' => 'Data saved successfully'], 201);
    }

    public function update(Request $request, $id)
    {
        $lab = Lab::find($id);

        if (!$lab) {
            return response()->json(['message' => 'Lab record not found'], 404);
        }

        $validatedData = $request->validate([
            'date' => 'required|date',
            'lab_name' => 'required',
            'patient_id' => 'required|exists:patients,id',
            'test_type' => 'required',
            'result' => 'required',
            'sample_collection_date' => 'nullable|date',
            'dispatch_to_lab_date' => 'nullable|date',
            'sample_received_date' => 'nullable|date',
            'processed_date' => 'nullable|date',
        ]);

        $lab->update($validatedData);

        return response()->json($lab);
    }

    public function destroy($id)
    {
        $lab = Lab::find($id);

        if (!$lab) {
            return response()->json(['message' => 'Lab record not found'], 404);
        }

        $lab->delete();

        return response()->json(['message' => 'Lab record deleted successfully']);
    }
}
