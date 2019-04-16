<?php

namespace App\Http\Controllers;


use App\Pictures;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Facades\Image;

class FileController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {

    }

    /**
     * Show the application dashboard.
     *
     * @return string
     */
    public function fileupload(Request $request)
    {
        $pictures = new Pictures();
        $validator = Validator::make(['url' => $request->input('url'), 'user_id' => Auth::user()->id, 'picture_url' => $request->file('picture_url')], $pictures->rules);
        if ($validator->fails()) {
            return response()->json(['message' => 'Не все поля заполнены.'], 500);
        }
        $path = public_path() . '\upload\\';
        $file = $request->file('picture_url');
        $filename = sprintf('%s.%s', str_random(20), $file->getClientOriginalExtension()) ?: 'png';
        $img = Image::make($file);
        $img->resize(null, 150, function ($constraint) {
            $constraint->aspectRatio();
        })->save($path . $filename);
        $pictures->url = $request->input('url');
        $pictures->user_id = Auth::user()->id;
        $pictures->picture_url = $filename;
        $pictures->save();
        return response()->json($pictures, '200');
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function fileupdate(Request $request)
    {
        $pictures = Pictures::find($request->header('id'));
        if (Gate::allows('admin') || Gate::allows('manager') || $pictures->user_id === Auth::id()) {
            if ($file = !empty($request->file('picture_url'))) {
                if (file_exists(public_path() . '\upload\\' . $pictures->picture_url)) {
                    unlink(public_path() . '\upload\\' . $pictures->picture_url);
                }
                $path = public_path() . '\upload\\';
                $file = $request->file('picture_url');
                $filename = sprintf('%s.%s', str_random(20), $file->getClientOriginalExtension()) ?: 'png';
                $img = Image::make($file);
                $img->resize(null, 150, function ($constraint) {
                    $constraint->aspectRatio();
                })->save($path . $filename);
                $pictures->picture_url = $filename;
            }
            $pictures->url = $request->input('url');
            $pictures->save();
            return response()->json($pictures, '200');
        } else {
            return response()->json(['message' => 'У вас нет права на редактирования этого баннера'], 500);
        }
    }
}
