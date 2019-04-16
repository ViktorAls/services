<?php
/**
 * Created by PhpStorm.
 * User: vipvi_mc4
 * Date: 28.03.2019
 * Time: 14:17
 */

namespace App\Http\Middleware;

use App\User;
use Closure;
use Illuminate\Foundation\Http\Middleware\CheckForMaintenanceMode as Middleware;
use Illuminate\Support\Facades\Gate;


class Ajax extends Middleware
{

    /**
     * @param \Illuminate\Http\Request $request
     * @param Closure $next
     * @param null $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if (!$request->ajax()) {
            abort(404);
        }
        return $next ($request);
    }

}
