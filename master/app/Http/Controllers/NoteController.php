<?php

namespace App\Http\Controllers;

use App\Models\Board;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\Note;
use Illuminate\Support\Facades\URL;
use Inertia\Inertia;

class NoteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $user = $request->user();

        return Inertia::render('Note', [
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
            'notes' => Note::where([
                'team_id' => $user->current_team_id,
                'user_id' => $user->id,
            ])->get(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, Response $response)
    {
        $note = new Note();
        $note->title = $request->title;
        $note->content = $request->content;
        $note->user_id = $request->user()->id;
        $note->team_id = $request->user()->current_team_id;
        $note->save();
        return $response->send($note);
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $note = Note::find($id);
        $note->update($request->post());
        return $note;

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $note = Note::find($id);
        $note->delete();
        return $note;
    }
}
