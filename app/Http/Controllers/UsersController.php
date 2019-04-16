<?php


namespace App\Http\Controllers;


use App\Connection;
use App\Role;
use App\User;
use App\User_role;
use Illuminate\Http\Request;


class UsersController extends Connection
{

    public function index()
    {
        $users = User::with('roles')->get();
        return view('user.index', compact('users'));
    }

    /**
     * @param mixed|null $id
     * @return int|void
     */
    public function userDelete($id)
    {
        User::where('id', '=', $id)->delete();
        return back();
    }

    public function controlUser(Request $request)
    {
        $user = User::where('id', '=', $request->post('id'))->with('roles')->first();

        foreach (Role::all() as $role) {
            $check = false;
            foreach ($user->roles as $role2) {
                if ($role->id === $role2['id']) {
                    $check = true;
                    break;
                }
            }
            $obj = new \stdClass();
            $obj->id = $role->id;
            $obj->text = $role->name;
            $obj->selected = $check;
            $json[] = $obj;
        }
        return view('user.role', compact('user', 'json'));
    }

    public function addRole(Request $request){
        $userRole = new User_role();
        $userRole->user_id = $request->post('idUser');
        $userRole->role_id = $request->post('idRole');
        if ($userRole->save()){
            return response()->json('Новая роль назначена',200);
        }
        return response()->json('Произошла ошибка',500);
    }

    public  function deleteRole(Request $request){
        if (User_role::where('user_id','=',$request->post('idUser'))->where('role_id','=',$request->post('idRole'))->delete()){
            return response()->json('Успешно удалено',200);
        }
        return response()->json('Произошла ошибка',500);
    }
}
