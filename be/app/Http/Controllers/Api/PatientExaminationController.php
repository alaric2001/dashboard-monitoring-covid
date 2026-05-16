<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\PatientExamination;
use App\Http\Controllers\Controller;

class PatientExaminationController extends Controller
{
    public function index()
    {
        $examinations = PatientExamination::all();
        return response()->json($examinations);
    }

    /**
     * Display the specified patient examination.
     *
     * @param  \App\Models\PatientExamination  $patientExamination
     * @return \Illuminate\Http\Response
     */
    public function show(PatientExamination $patientExamination)
    {
        return response()->json($patientExamination);
    }

    /**
     * Remove the specified patient examination from storage.
     *
     * @param  \App\Models\PatientExamination  $patientExamination
     * @return \Illuminate\Http\Response
     */
    public function destroy(PatientExamination $patientExamination)
    {
        $patientExamination->delete();
        return response()->json(['message' => 'Patient examination deleted successfully']);
    }
      /**
     * Store a newly created patient examination in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'weight' => 'required|integer',
            'height' => 'required|integer',
            'blood' => 'required|string',
            'notes' => 'nullable|string',
            'patient_id' => 'required|exists:patients,id',
            'covid_case' => 'required|boolean',
        ]);

        $examination = PatientExamination::create($validatedData);
        return response()->json($examination, 201);
    }

    //Post Multiple PatientExamination Data in One Click
    public function multipleExamination(Request $request)
    {
        $data = $request->all();
        foreach ($data as $entry) {
            PatientExamination::create($entry); 
        }
        return response()->json(['message' => 'Data saved successfully'], 201);
    }
    
     /**
     * Update the specified patient examination in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PatientExamination  $patientExamination
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PatientExamination $patientExamination)
    {
        $validatedData = $request->validate([
            'weight' => 'required|integer',
            'height' => 'required|integer',
            'blood' => 'required|string',
            'notes' => 'nullable|string',
            'patient_id' => 'required|exists:patients,id',
            'covid_case' => 'required|boolean',
        ]);

        $patientExamination->update($validatedData);
        return response()->json($patientExamination, 200);
    }
}
