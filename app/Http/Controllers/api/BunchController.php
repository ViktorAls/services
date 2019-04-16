<?php

namespace App\Http\Controllers\api;

use App\Connection;
use App\Http\Resources\PicturesResource;
use App\Pictures;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BunchController extends Controller
{
    public function jsonBanner(Request $request)
    {
        $MyPicture = Connection::where('domains', '=', $request->get('domains'))->where('key', '=', $request->get('key'))->first();
        if ($MyPicture !== null) {
            $userP = json_decode($MyPicture->picture_json, false);
            $in = [];
            if ($userP !== null) {
                foreach ($userP as $item) {
                    $in[] += $item->id;
                }
            }
            PicturesResource::withoutWrapping();
            return PicturesResource::collection(Pictures::whereIn('id', $in, '')->get());
        }
        return response()->json("Нет доступа", 401);
    }
}
