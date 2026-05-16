<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Doctor;
use Carbon\Carbon;

class DoctorController extends Controller
{
    public function index ()
    {
        $doctors = Doctor::all();
        foreach ($doctors as $item) {
            $item->birth_date = Carbon::createFromFormat('Y-m-d', $item->birth_date)->format('d/m/Y');
        }
        return response()->json($doctors);
    }

    public function show (Doctor $doctor)
    {
        return response()->json($doctor);
    }

    public function store (Request $request)
    {
        $validatedData = $request->validate([ 
            'name'            => 'required|string',
            'gender'          => 'required|string',
            'birth_date'      => 'nullable|date',
            'address'         => 'nullable|string',
            'contact'         => 'nullable|string',
            'specialization'  => 'required|string',
        ]);

        $doctor = Doctor::create($validatedData);
        return response()->json($doctor, 201);
    }

    //Post Multiple Doctor Data in One Click
    public function multipleDR(Request $request)
    {
        $data = $request->all();
        foreach ($data as $entry) {
            Doctor::create($entry); 
        }
        return response()->json(['message' => 'Data saved successfully'], 201);
    }

    public function update (Request $request, Doctor $doctor)
    {
        $validatedData = $request->validate([ 
            'name'            => 'required|string',
            'gender'          => 'required|string',
            'birth_date'      => 'nullable|date',
            'address'         => 'nullable|string',
            'gender'          => 'nullable|string',
            'contact'         => 'nullable|string',
            'specialization'  => 'required|string',
        ]);

        $doctor->update($validatedData);
        return response()->json($doctor, 200);
    }

    public function destroy (Doctor $doctor)
    {
        $doctor->delete();
        return response()->json([ 'message' => 'Doctor deleted successfully' ]);
    }
}
