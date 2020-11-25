<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeStaticController extends Controller
{
    public function home(Request $request)
    {
        return view('static-page/index');
    }
}
