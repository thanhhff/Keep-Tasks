<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Laravel\Jetstream\Jetstream;
use Inertia\Inertia;

class HomeStaticController extends Controller
{
    public function index2(Request $request)
    {
        return view('static-page/index');
    }
}
