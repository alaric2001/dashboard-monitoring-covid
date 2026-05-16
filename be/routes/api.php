<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\Api\WardController;
use App\Http\Controllers\Api\RoomController;
use App\Http\Controllers\Api\PatientController;
use App\Http\Controllers\Api\PatientExaminationController;
use App\Http\Controllers\Api\LabController;
use App\Http\Controllers\Api\RadiologyController;
use App\Http\Controllers\Api\DoctorController;
use App\Http\Controllers\Api\NurseController;
use App\Http\Controllers\Api\MedicineController;

// TTV
use App\Http\Controllers\Api\RespirationRateController;
use App\Http\Controllers\Api\HeartRateController;
use App\Http\Controllers\Api\Spo2Controller;
use App\Http\Controllers\Api\TemperatureController;
use App\Http\Controllers\Api\NibpController;
use App\Http\Controllers\Api\VitalSignController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::apiResource('patients', PatientController::class);
Route::apiResource('patient-examinations', PatientExaminationController::class);
Route::apiResource('wards',WardController::class);
Route::apiResource('rooms',RoomController::class);
Route::apiResource('labs',LabController::class);
Route::apiResource('radiologies', RadiologyController::class);
Route::apiResource('doctors', DoctorController::class);
Route::apiResource('nurses', NurseController::class);
Route::apiResource('medicines', MedicineController::class);


//PATIENT
Route::get('/patient-ttv', [PatientController::class, 'indexAndTtv']);
Route::get('/patient-ttv/{id}', [PatientController::class, 'detailAndTtv']);

//Post Multiple Patient Examination
Route::post('/multipleExamination', [PatientExaminationController::class, 'multipleExamination']);

//Post Multiple Doctor
Route::post('/multipleDr', [DoctorController::class, 'multipleDR']);

//Post Multiple Nurse
Route::post('/multipleNurse', [NurseController::class, 'multipleNurse']);

//Post Multiple Ward
Route::post('/multipleWards', [WardController::class, 'multipleWardInput']);

//Post Multiple Room
Route::post('/multipleRooms', [RoomController::class, 'multipleRoomInput']);

//Post Multiple Medicines
Route::post('/multipleMedicines', [MedicineController::class, 'multipleMedicine']);

//Post Multiple Labs
Route::post('/multipleLabs', [LabController::class, 'multipleLab']);

//Post Multiple Radiologys
Route::post('/multipleRadiologies', [RadiologyController::class, 'multipleRadiology']);


//Respiration Rate
Route::apiResource('respirationRate', RespirationRateController::class);
//Post Multiple Respiration Rate
Route::post('/multipleRR', [RespirationRateController::class, 'multipleRR']);
//Get Last 20 data Respiration Rate
Route::get('/last20rr', [RespirationRateController::class, 'last20DataRr']);

//Heart Rate
Route::apiResource('heartRate', HeartRateController::class);
//Post Multiple Heart Rate
Route::post('/multipleHR', [HeartRateController::class, 'multipleHR']);
//Get Last 20 data HR
Route::get('/last20hr', [HeartRateController::class, 'last20DataHr']);

//SPO2
Route::apiResource('spo2', Spo2Controller::class);
//Post Multiple SPO2
Route::post('/multipleSpo2', [Spo2Controller::class, 'multipleSpo2Input']);
//Get Last 20 data SPO2
Route::get('/last20spo2', [Spo2Controller::class, 'last20DataSpo2']);

//Temperature
Route::apiResource('temp', TemperatureController::class);
//Post Multiple Temperature
Route::post('/multipleTemp', [TemperatureController::class, 'multipleTempInput']);
//Get Last 20 data Temp
Route::get('/last20temp', [TemperatureController::class, 'last20DataTemp']);

//Non-Invasive Blood Pressure
Route::apiResource('nibp', NibpController::class);
//Post Multiple Non-Invasive Blood Pressure
Route::post('/multipleNibp', [NibpController::class, 'multipleNibpInput']);
//Get Last 20 data NIBP
Route::get('/last20nibp', [NibpController::class, 'last20DataNibp']);

// Post vital Sign Together
Route::apiResource('/vitalsign', VitalSignController::class);
//Edit TTV
Route::post('update-patient-check/{patientId}/{vitalSignId}/{type}/{currentValue}', [VitalSignController::class, 'updatePatientCheck']);

Route::get("/user", [ UserController::class, "index" ]);
Route::post("/user", [ UserController::class, "submit" ]);
Route::delete("/user/{user}", [ UserController::class, "destroy" ]);
Route::get("/user/{user}", [ UserController::class, "show" ]);
Route::patch("/user/{user}", [ UserController::class, "update" ]);
