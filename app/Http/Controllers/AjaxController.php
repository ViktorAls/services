<?php

namespace App\Http\Controllers;


use App\Connection;
use App\Pictures;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AjaxController extends Controller
{

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        $condition = new Connection();
        $condition->domains = $request->post('domains');
        $condition->key = sha1(time());
        $condition->user_id = Auth::id();
        if ($condition->save()) {
            return response()->json(['Успех'], '200');
        }
        return response()->json(['Ошибка'], '500');
    }


    public function editing(Request $request)
    {
            $bunch = Connection::where('user_id', '=', Auth::id())->where('id', '=', $request->post('pk'))->first();
            if ($bunch !== null) {
                $bunch->domains = $request->post('value');
               if ($bunch->save()){
                   return response()->json(['success' => 'Yes'], 200);
               }
            }
            return response()->json(['error' => 'There was an error adding'], 500);


    }


    public function add(Request $request)
    {
        $connection = Connection::where('user_id', '=', Auth::id())
            ->where('id', '=', $request->post('id'))->first();
        if (empty($connection)) {
            return response()->json(['Ошибка'], '500');
        }
        $connection->picture_json = $request->post('json');
        $connection->save();
        return response()->json(['Измененние произошло успешно'], '200');
    }

    public function delete(Request $request)
    {
        $pictures = Pictures::where('user_id', '=', Auth::id())
            ->where('id', '=', $request->post('id'))->first();
        if ($pictures !== null) {
            $pictures->delete();
            return response()->json(['Измененние произошло успешно'], '200');
        }
        return response()->json(['Ошибка при удалении'], '500');

    }
}
