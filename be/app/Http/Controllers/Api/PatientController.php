<?php

namespace App\Http\Controllers\Api;

use App\Models\Patient;
use App\Models\Ews;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Carbon\Carbon;

class PatientController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // $patients = Patient::all();
        $patients = Patient::with('room')->get();
        foreach ($patients as $item) {
            $item->admission_date = Carbon::createFromFormat('Y-m-d', $item->admission_date)->format('d/m/Y');
            $item->discharge_date = $item->discharge_date ? Carbon::createFromFormat('Y-m-d', $item->discharge_date)->format('d/m/Y') : '-';
            $item->birth = Carbon::createFromFormat('Y-m-d', $item->birth)->format('d/m/Y');
        
            //TAKE LAST Room for Patient
            $latestRoomPatient = $item->room->last();
            $patient_room= $latestRoomPatient ? $latestRoomPatient->room_name : '-';
            $item->patient_room = $patient_room;
        }
        return response()->json($patients);
    }

    public function indexAndTtv()
    {
        $patients = Patient::with('temp', 'spo2', 'rr', 'hr', 'nibp', 'room', 'examination')->get();

        foreach ($patients as $item) {
            if ($item->admission_date) {
            $item->admission_date = Carbon::createFromFormat('Y-m-d', $item->admission_date)->format('d/m/Y');
            }
            // if ($item->discharge_date) {
            //     $item->discharge_date = Carbon::createFromFormat('Y-m-d', $item->discharge_date)->format('d/m/Y');
            // }
            $item->discharge_date = $item->discharge_date ? Carbon::createFromFormat('Y-m-d', $item->discharge_date)->format('d/m/Y') : '-';
            if ($item->birth) {
                // $item->birth = Carbon::createFromFormat('Y-m-d', $item->birth)->format('d/m/Y');
                
                // Parse the birthdate using the 'Y-m-d' format
                $parsedBirthdate = Carbon::createFromFormat('Y-m-d', $item->birth);
                
                // Calculate age based on birthdate  
                $age = $parsedBirthdate->age;
                
                // Format the birthdate for display
                $formattedBirthdate = $parsedBirthdate->format('d/m/Y');
                $item->birth = $formattedBirthdate; // Update birthdate
                $item->age = $age; // Add age to the patient object
            }

            // TAKE Last Vital Sign
            //HR
            $latestHrPatient = $item->hr->last();
            $patient_hr = $latestHrPatient ? $latestHrPatient->heart_beats : 0;
            $alert_hr_date = $latestHrPatient ? Carbon::parse($latestHrPatient->created_at)->format('H:i d/m/Y') : null;
            // if($patient_hr > 130 ||(($patient_hr >= 1 && $patient_hr < 40) || ($patient_hr > 120))){
            if($patient_hr >= 131 ||(($patient_hr >= 1 && $patient_hr <= 40) || ($patient_hr >= 111 && $patient_hr <= 130))){
                $item->alert_hr_date = $alert_hr_date;
                $item->alert_patient_hr = $patient_hr;
            }

            //RR
            $latestRrPatient = $item->rr->last();
            $patient_rr= $latestRrPatient ? $latestRrPatient->breaths : 0;
            $alert_rr_date = $latestRrPatient ? Carbon::parse($latestRrPatient->created_at)->format('H:i d/m/Y') : null;
            if(($patient_rr > 25) ||  ($patient_rr >= 1 && $patient_rr < 8) || ($patient_rr >= 21 &&  $patient_rr <= 24)){
                $item->alert_rr_date = $alert_rr_date;
                $item->alert_patient_rr = $patient_rr;
            }

            //TEMP
            $latestTempPatient = $item->temp->last();
            $patient_temp = $latestTempPatient ? $latestTempPatient->patient_temp : 0;
            $alert_temp_date = $latestTempPatient ? Carbon::parse($latestTempPatient->created_at)->format('H:i d/m/Y') : null;
            if(($patient_temp >=1 && $patient_temp <= 35) || $patient_temp >= 39.1){
                $item->alert_temp_date = $alert_temp_date;
                $item->alert_patient_temp = $patient_temp;
            }


            //Spo2
            $latestSpo2Patient = $item->spo2->last();
            $patient_spo2 = $latestSpo2Patient ? $latestSpo2Patient->blood_oxygen : 0;
            $alert_date_spo2 = $latestSpo2Patient ? Carbon::parse($latestSpo2Patient->created_at)->format('H:i d/m/Y') : null;
            if(($patient_spo2 >= 1 && $patient_spo2 <= 91) || 
            ($patient_spo2 >= 92 && $patient_spo2 <= 93)){
                $item->alert_spo2_date = $alert_date_spo2;
                $item->alert_patient_spo2 = $patient_spo2;
            }
            
            //Nibp
            $latestNibpPatient = $item->nibp->last();
            $patient_systolic = $latestNibpPatient ? $latestNibpPatient-> systolic : 0;
            $patient_diastolic = $latestNibpPatient ? $latestNibpPatient-> diastolic : 0;
            $nibp_date_alert = $latestNibpPatient ? Carbon::parse($latestNibpPatient->created_at)->format('H:i d/m/Y') : null;
            if(($patient_systolic >= 220  || ($patient_systolic >= 1 && $patient_systolic <= 90) || $patient_diastolic > 120 || ( $patient_diastolic >= 1 && $patient_diastolic <= 33)) || 
                (($patient_systolic >= 91 && $patient_systolic <= 100) || 
                ($patient_diastolic >= 90 && $patient_diastolic <= 120) ||
                ($patient_diastolic >= 34 && $patient_diastolic <= 40))){
                $item->alert_nibp_date = $nibp_date_alert;
                $item->alert_patient_systolic = $patient_systolic;
                $item->alert_patient_diastolic = $patient_diastolic;
            }

            //Indikator EWScore perbaris table & Filter hanya pasien kondisi darurat (RED & Orange) utk page EWSystem 
            if (($patient_rr > 25) ||  ($patient_rr >= 1 && $patient_rr < 8) || 
                ($patient_hr >= 131) || ($patient_hr >= 1 && $patient_hr <= 40) ||
                ($patient_temp >=1 && $patient_temp <= 35) ||
                ($patient_spo2 >= 1 && $patient_spo2 <= 91) || 
                ($patient_systolic >= 220  || ($patient_systolic >= 1 && $patient_systolic <= 90) || $patient_diastolic > 120 || ( $patient_diastolic >= 1 && $patient_diastolic <= 33))) {
                $item->indicator = 'red'; // Add a warning flag

            } elseif (($patient_hr >= 111 && $patient_hr < 130) || 
                ($patient_rr >= 21 &&  $patient_rr <= 24) ||
                ($patient_temp >= 39.1) ||
                ($patient_spo2 >= 92 && $patient_spo2 <= 93) || 
                ($patient_systolic >= 91 && $patient_systolic <= 100) || ($patient_diastolic >= 90 && $patient_diastolic <= 120) || ($patient_diastolic >= 34 && $patient_diastolic <= 40)) {
                $item->indicator = 'orange';

            } elseif (($patient_hr >= 41 && $patient_hr <= 50) || ($patient_hr >= 91 && $patient_hr <= 110) ||
                ($patient_rr >= 9 &&  $patient_rr <= 11) || 
                ($patient_temp >= 35.1 && $patient_temp <= 36) || ($patient_temp >= 38.1 && $patient_temp <= 39) ||
                ($patient_spo2 >= 94 && $patient_spo2 <= 95) || 
                ($patient_systolic >= 101 && $patient_systolic <= 110) || ($patient_diastolic >= 80 && $patient_diastolic <= 89) || ($patient_diastolic >= 41 && $patient_diastolic <= 60)) {
                $item->indicator = 'yellow';

            } elseif (($patient_hr >= 51 && $patient_hr <= 90) || 
                ($patient_rr >= 12 &&  $patient_rr <= 20) ||
                ($patient_temp >= 36.1 && $patient_temp <= 38) || 
                $patient_spo2 >= 96 || 
                ($patient_systolic >= 111 && $patient_systolic <= 219) || ($patient_diastolic >= 61 && $patient_diastolic < 80)) {
                $item->indicator = 'green';

            } else {
                $item->indicator = 'blue'; // No warning
            }
            
            //TAKE LAST Room for Patient
            $latestRoomPatient = $item->room->last();
            $patient_room= $latestRoomPatient ? $latestRoomPatient->room_name : '-';
            $item->patient_room = $patient_room;

            // dd($patient_spo2_date);
            
        }
        
        return response()->json($patients);
    }

    public function detailAndTtv($id)
    {
        // $id = $request->input('id');
        $patient = Patient::with([
            'temp'=> function ($query) {
                $query->latest()->limit(10);
                // $query->orderBy('created_at', 'asc')->take(10);
                //Nunggu 10 dulu baru di kirim datanya. kalau 13 data, yg terkitim 10 awal. 3 akhirnya gk akan dikirim, kecuali klo totalnya sudah 20
                }, 
            'spo2'=> function ($query) {
                $query->latest()->limit(10);
            },
            'rr'=> function ($query) {
                $query->latest()->limit(10);
                }, 
            'hr'=> function ($query) {
                $query->latest()->limit(10);
                }, 
            'nibp'=> function ($query) {
                $query->latest()->limit(10);
                // $query->orderBy('created_at', 'asc')->take(10);
                },
            'examination' => function ($query) {
                $query->with('doctor')->latest()->take(1); // Load doctor relationship and get the latest examination
            },
            'room'
            ])->find($id);

            $patient->admission_date = Carbon::createFromFormat('Y-m-d', $patient->admission_date)->format('d/m/Y');
            $patient->discharge_date = $patient->discharge_date ? Carbon::createFromFormat('Y-m-d', $patient->discharge_date)->format('d/m/Y') : '-';
            $patient->birth = $patient->birth ? Carbon::createFromFormat('Y-m-d', $patient->birth)->format('d/m/Y'): '-';

            //TAKE LAST Room for Patient
            $latestRoomPatient = $patient->room->last();
            $patient_room= $latestRoomPatient ? $latestRoomPatient->room_name : '-';
            $patient->patient_room = $patient_room;
        if ($patient) {
            return response()->json($patient);
        } else {
            return response()->json(['message' => 'Patient not found'], 404);
        }
        // foreach ($patient as $item) {
        //     //TAKE LAST Room for Patient
        //     $latestRoomPatient = $item->room->last();
        //     $patient_room= $latestRoomPatient ? $latestRoomPatient->room_name : '-';
        //     $item->patient_room = $patient_room;
        // }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'patient_name' => 'required',
            'admission_date' => 'required|date',
            'discharge_date' => 'nullable|date',
            'gender' => 'required',
            'birth' => 'nullable|date',
            'id_card' => 'nullable',
            'address' => 'nullable',
            'contact' => 'nullable',
            'education' => 'nullable',
            'occupation' => 'nullable',
            'photo' => 'nullable',
            'referred' => 'nullable',
            'next_of_kin_name' => 'required',
            'relationship' => 'nullable',
            'next_of_kin_address' => 'nullable',
            'next_of_kin_contact' => 'nullable',
        ]);

        $patient = Patient::create($validatedData);

        return response()->json($patient, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $patient = Patient::find($id);

        if (!$patient) {
            return response()->json(['message' => 'Patient not found'], 404);
        }

        return response()->json($patient);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $patient = Patient::find($id);

        if (!$patient) {
            return response()->json(['message' => 'Patient not found'], 404);
        }

        $validatedData = $request->validate([
            'patient_name' => 'required',
            'admission_date' => 'required|date',
            'discharge_date' => 'nullable|date',
            'gender' => 'required',
            'birth' => 'nullable|date',
            'id_card' => 'nullable',
            'address' => 'nullable',
            'contact' => 'nullable',
            'education' => 'nullable',
            'occupation' => 'nullable',
            'photo' => 'nullable',
            'referred' => 'nullable',
            'next_of_kin_name' => 'required',
            'relationship' => 'nullable',
            'next_of_kin_address' => 'nullable',
            'next_of_kin_contact' => 'nullable',
        ]);

        $patient->update($validatedData);

        return response()->json($patient);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $patient = Patient::find($id);

        if (!$patient) {
            return response()->json(['message' => 'Patient not found'], 404);
        }

        $patient->delete();

        return response()->json(['message' => 'Patient deleted successfully']);
    }
}
