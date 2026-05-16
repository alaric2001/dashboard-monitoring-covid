<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Radiology;
use Carbon\Carbon;

class RadiologyController extends Controller
{
    public function index ()
    {
        $radiologies = Radiology::all();
        foreach ($radiologies as $item) {
            $item->approved_date = Carbon::createFromFormat('Y-m-d', $item->approved_date)->format('d/m/Y');
            $item->processed_date = Carbon::createFromFormat('Y-m-d', $item->processed_date)->format('d/m/Y');
        }
        return response()->json($radiologies);
    }

    public function show (Radiology $radiology)
    {
        return response()->json($radiology);
    }

    public function store (Request $request)
    {
        $validatedData = $request->validate([ 
            'patient_id'     => 'required|exists:patients,id',
            'date'           => 'required|date',
            'radiology_exam' => 'required|string',
            'approved_date'  => 'nullable|date',
            'processed_date' => 'nullable|date',
            'result'         => 'nullable|file',
            'doctor_id'      => 'required|exists:doctors,id',
        ]);

        $radiology = Radiology::create($validatedData);
        return response()->json($radiology, 201);
    }
    //Post Multiple Radiology Data in One Click
    public function multipleRadiology(Request $request)
    {
        $data = $request->all();
        foreach ($data as $entry) {
            Radiology::create($entry); 
        }
        return response()->json(['message' => 'Data saved successfully'], 201);
    }

    public function update (Request $request, Radiology $radiology)
    {
        $validatedData = $request->validate([ 
            'patient_id'     => 'required|exists:patients,id',
            'date'           => 'required|date',
            'radiology_exam' => 'required|string',
            'approved_date'  => 'nullable|date',
            'processed_date' => 'nullable|date',
            'result'         => 'nullable|file',
            'doctor_id'      => 'required|exists:doctors,id',
        ]);

        $radiology->update($validatedData);
        return response()->json($radiology, 200);
    }

    public function destroy (Radiology $radiology)
    {
        $radiology->delete();
        return response()->json([ 'message' => 'Radiology deleted successfully' ]);
    }
}
