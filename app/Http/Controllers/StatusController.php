<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller;

class StatusController extends Controller
{
    public function index()
    {
        return collect([
             'my-application' => [[
                  'description' => config('app.description'),
                  'version'     => config('app.version') . '-' . config('app.build'), 
                  'sha'         => config('app.commit'),
             ]]
         ])->toJson();
    }
}
