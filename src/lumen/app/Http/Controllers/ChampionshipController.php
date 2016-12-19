<?php

namespace App\Http\Controllers;

use App\Championship;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ChampionshipController extends Controller {

    public function index() {
        $championships = Championship::all();
        $response = response();
        $response->header('Access-Control-Allow-Methods', 'HEAD, GET, POST, PUT, PATCH, DELETE');
        $response->header('Access-Control-Allow-Headers', $request->header('Access-Control-Request-Headers'));
        $response->header('Access-Control-Allow-Origin', '*');
        return $response->json($championships);
    }

    public function get($id) {
        $championship = Championship::find($id);
        return response()->json($championship);
    }

    public function save(Request $request) {
        $championship = Championship::create($request->all());
        return response()->json($championship);
    }

    public function delete($id) {
        $championship = Championship::find($id);
        $championship->delete();
        return response()->json('success');
    }

}
