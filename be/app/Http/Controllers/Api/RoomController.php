<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Room;

class RoomController extends Controller
{
    public function index ()
    {
        $rooms = Room::all();
        return response()->json($rooms);
    }

    public function store (Request $request)
    {
        $validatedData = $request->validate([ 
            'room_name'  => 'required',
            'patient_id' => 'nullable|exists:patients,id',
            'ward_id'    => 'required|exists:wards,id',
        ]);

        $room = Room::create($validatedData);

        return response()->json($room, 201);
    }
    public function update (Request $request, $id)
    {
        $room = Room::find($id);

        if ( !$room )
        {
            return response()->json([ 'message' => 'Room not found' ], 404);
        }

        $validatedData = $request->validate([ 
            'room_name'  => 'required',
            'patient_id' => 'nullable|exists:patients,id',
            'ward_id'    => 'required|exists:wards,id',
        ]);

        $room->update($validatedData);

        return response()->json($room);
    }

    //Post Multiple Room Data
    public function multipleRoomInput(Request $request)
    {
        $data = $request->all();
        foreach ($data as $entry) {
            Room::create($entry); // Save the data to the database using Eloquent
        }
        return response()->json(['message' => 'Patient Room Data saved successfully']);
    }

    public function show ($id)
    {
        $room = Room::find($id);

        if ( !$room )
        {
            return response()->json([ 'message' => 'Room not found' ], 404);
        }

        return response()->json($room);
    }
    public function destroy ($id)
    {
        $room = Room::find($id);

        if ( !$room )
        {
            return response()->json([ 'message' => 'Room not found' ], 404);
        }

        $room->delete();

        return response()->json([ 'message' => 'Room deleted successfully' ]);
    }
}
