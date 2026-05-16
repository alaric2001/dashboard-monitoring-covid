<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\HeartRate;
use App\Models\Nibp;
use App\Models\RespirationRate;
use App\Models\Spo2;
use App\Models\Temperature;

class VitalSignController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
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
        $createRespiratoryData = RespirationRate::create([
            'patient_id' => $request->patientId,
            'breaths' => $request->breath,
        ]);
        $createNibpData = Nibp::create([
            'patient_id' => $request->patientId,
            'diastolic' => $request->diastolik,
            'systolic' => $request->sistolik,
        ]);
        $createSpo2Data = Spo2::create([
            'blood_oxygen'  => $request->blood_oxygen,
            'patient_id' => $request->patientId
        ]);
        $createTemperatureData = Temperature::create([
            'patient_id' => $request->patientId,
            'patient_temp' => $request->patientTemp,
        ]);

        return response()->json(["message" => "Success"]);
    }


    public function updatePatientCheck($patientId, $vitalSignId, $type, $currentValue)
    {
        try {
            //  dd($patientId, $vitalSignId, $type, $currentValue);
            if ($type === 'hr') {
                $model = HeartRate::findOrFail($vitalSignId);
            } elseif ($type === 'rr') {
                $model = RespirationRate::findOrFail($vitalSignId);
            } elseif ($type === 'temp') {
                $model = Temperature::findOrFail($vitalSignId);
            } elseif ($type === 'spo2') {
                $model = Spo2::findOrFail($vitalSignId);
            } elseif ($type === 'nibp') {
                $model = Nibp::findOrFail($vitalSignId);
            }
            else {
                return response()->json(['message' => 'Invalid vital sign type'], 400);
            }
            
            // // $model->update(['patient_check' => 1]);
             $newValue = $currentValue == 1 ? 0 : 1;
            $model->update(['patient_check' => $newValue]);

            return response()->json(['message' => 'Patient check updated successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Error updating patient check'], 500);
        }
    }





    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
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
