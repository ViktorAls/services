<?php

namespace App\Http\Controllers;

use App\Connection;
use App\Pictures;
use App\User;
use Illuminate\Auth\Access\Gate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $banners = Pictures::where('user_id', '=', Auth::id())
            ->get();
        return view('home', compact('banners'));
    }


    public function bunch($id)
    {
        $userPictures = Connection::where('id','=',$id)->where('user_id','=',Auth::id())->first();
        if (empty($userPictures)){
            abort('404','Cтраница не найдена');
        }
        $in = [];
        $userP = json_decode($userPictures->picture_json,false);
        if ($userP!== null) {
            foreach ( $userP as $item) {
                $in[] += $item->id;
            }
        }
        if (empty($in)) {
            $pictures = DB::table('pictures')
                ->leftJoin('users', 'users.id', '=', 'pictures.user_id')
                ->leftJoin('user_role', 'users.id', '=', 'user_role.user_id')
                ->where(function ($q){
                    $q->where('pictures.user_id', '=', Auth::id())
                        ->orWhere('role_id', '!=', null);
                })->distinct()->get(['pictures.id','pictures.url','pictures.picture_url']);
        } else {
            $userPicture = Pictures::whereIn('id',$in)->get();
            $pictures = DB::table('pictures')
                ->leftJoin('users', 'users.id', '=', 'pictures.user_id')
                ->leftJoin('user_role', 'users.id', '=', 'user_role.user_id')->where(function ($q){
                    $q->where('pictures.user_id', '=', Auth::id())
                        ->orWhere('role_id', '!=', null);
                })->distinct()
                ->whereNotIn('pictures.id',$in)->get(['pictures.id','pictures.url','pictures.picture_url']);
        }
        return view('bunch', compact('pictures','userPicture'));
    }

    public function fullbunch(Request $request)
    {
        $connections = Connection::where('user_id', Auth::id())->get();
        return view('fullbunch', compact('connections'));
    }


    public function delete(Request $request, $id)
    {
        $con = Connection::find($id);
        if (\Illuminate\Support\Facades\Gate::allows('update', $con)) {
            $con->delete();
            return back()->with('success', 'Все прошло успешно');
        }
        return back()->with('error', 'Произошла ошибка');
    }

}
