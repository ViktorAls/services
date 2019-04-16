<?php

namespace App;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Connection
 * @package App
 *
 * @mixin QueryBuilder
 */
class Connection extends Model
{

    public $table = 'connection';

    protected $fillable = ['picture_json','domains','user_id','key','created_at','updated_at'];


    public function users()
    {
        return $this->hasOne('App\User');
    }

}
