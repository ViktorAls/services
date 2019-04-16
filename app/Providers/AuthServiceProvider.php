<?php

namespace App\Providers;

use App\User;
use Illuminate\Contracts\Auth\Access\Gate as GateContract;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @param GateContract $gate
     * @return void
     */
    public function boot(GateContract $gate)
    {
        $this->registerPolicies();
        $gate->define('admin', function (User $user) {
            foreach ($user->roles as $role){
                if ($role->name == 'admin'){
                    return true;
                }
            }
            return false;
        });


        $gate->define('update', function (User $user, $post) {
           return $user->id === $post->user_id;
        });

        $gate->define('manager', function (User $user) {
            foreach ($user->roles as $role){
                if ($role->name == 'manager'){
                    return true;
                }
            }
            return false;
        });
    }
}
