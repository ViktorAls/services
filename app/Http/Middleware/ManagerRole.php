<?php
/**
 * Created by PhpStorm.
 * User: vipvi_mc4
 * Date: 28.03.2019
 * Time: 14:18
 */

namespace App\Http\Middleware;
use Closure;
use Illuminate\Foundation\Http\Middleware\CheckForMaintenanceMode as Middleware;
use Illuminate\Support\Facades\Gate;


class ManagerRole extends Middleware
{
    /**
     * @param \Illuminate\Http\Request $request
     * @param Closure $next
     * @param null $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if(Gate::denies('manager')){
            return abort(404);
        }
        return $next($request);
    }
}
