<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Nurse;
use Carbon\Carbon;

class NurseController extends Controller
{
    public function index ()
    {
        $nurses = Nurse::all();
         foreach ($nurses as $item) {
            $item->birth_date = Carbon::createFromFormat('Y-m-d', $item->birth_date)->format('d/m/Y');
        }
        return response()->json($nurses);
    }

    public function show (Nurse $nurse)
    {
        return response()->json($nurse);
    }

    public function store (Request $request)
    {
        $validatedData = $request->validate([ 
            'name'            => 'required|string',
            'gender'          => 'required|string',
            'birth_date'      => 'nullable|date',
            'address'         => 'nullable|string',
            'gender'          => 'nullable|string',
            'contact'         => 'nullable|string',
            'department'      => 'nullable|string',
        ]);

        $nurse = Nurse::create($validatedData);
        return response()->json($nurse, 201);
    }

    //Post Multiple Nurse Data in One Click
    public function multipleNurse(Request $request)
    {
        $data = $request->all();
        foreach ($data as $entry) {
            Nurse::create($entry); 
        }
        return response()->json(['message' => 'Data saved successfully'], 201);
    }

    public function update (Request $request, Nurse $nurse)
    {
        $validatedData = $request->validate([ 
            'name'            => 'required|string',
            'gender'          => 'required|string',
            'birth_date'      => 'nullable|date',
            'address'         => 'nullable|string',
            'gender'          => 'nullable|string',
            'contact'         => 'nullable|string',
            'department'      => 'nullable|string',
        ]);

        $nurse->update($validatedData);
        return response()->json($nurse, 200);
    }

    public function destroy (Nurse $nurse)
    {
         $nurse->delete();
        return response()->json([ 'message' => 'Nurse deleted successfully' ]);
    }
}
