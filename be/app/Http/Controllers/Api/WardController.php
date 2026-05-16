<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Ward;
use App\Http\Resources\WardResource;
use App\Http\Requests\WardFormRequest;
use Illuminate\Http\Resources\Json\JsonResource;

class WardController extends Controller
{
    // public function index () : JsonResource
    // {
    //     return new WardResource(200, 'success', Ward::latest()->get());
    // }

    public function index ()
    {
        // return new WardResource(200, 'success', Ward::latest()->get(), );
        // $wards = Ward::all();
        $wards = Ward::with('room')->get();
         foreach ($wards as $item) {
            $item->rates = number_format($item->rates);
        }
        return response()->json($wards);
    }


    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'ward_name' => 'required',
            'class' => 'required',
            'desc' => 'nullable',
            'facilities' => 'nullable',
            'rates' => 'nullable|numeric',
        ]);

        $ward = Ward::create($validatedData);

        return response()->json($ward, 201);
    }

    //Post Multiple Ward Data
    public function multipleWardInput(Request $request)
    {
        $data = $request->all();
        foreach ($data as $entry) {
            Ward::create($entry); // Save the data to the database using Eloquent
        }
        return response()->json(['message' => 'Patient Ward Data saved successfully']);
    }

    public function show($id)
    {
        $ward = Ward::find($id);

        if (!$ward) {
            return response()->json(['message' => 'Ward not found'], 404);
        }

        return response()->json($ward);
    }

    public function update(Request $request, $id)
    {
        $ward = Ward::find($id);

        if (!$ward) {
            return response()->json(['message' => 'Ward not found'], 404);
        }

        $validatedData = $request->validate([
            'ward_name' => 'required',
            'class' => 'required',
            'desc' => 'nullable',
            'facilities' => 'nullable',
            'rates' => 'nullable|numeric',
        ]);

        $ward->update($validatedData);

        return response()->json($ward);
    }

    public function destroy($id)
    {
        $ward = Ward::find($id);

        if (!$ward) {
            return response()->json(['message' => 'Ward not found'], 404);
        }

        $ward->delete();

        return response()->json(['message' => 'Ward deleted successfully']);
    }
}
