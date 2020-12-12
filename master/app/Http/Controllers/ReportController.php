<?php


namespace App\Http\Controllers;


use App\Models\Board;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Inertia\Inertia;

class ReportController extends Controller
{
    public function index(Request $request)
    {
        $user = $request->user();

        return Inertia::render('Report', [
            'boards' => Board::where([
                'team_id' => $user->current_team_id,
                'user_id' => $user->id
            ])->get()->map(function ($board) {
                return [
                    'id' => $board->id,
                    'name' => $board->name,
                    'link' => URL::route('boards', $board),
                ];
            }),
        ]);
    }
}
