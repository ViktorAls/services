<?php

namespace App;

use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Pictures
 * @mixin QueryBuilder
 * @package App
 */
class Pictures extends Model
{

    public   $rules = [
        'url' => 'required',
        'picture_url' => 'required',
        'user_id'=>'required',
    ];

    protected $fillable = ['url','picture_url','user_id'];


    public function users()
    {
        return $this->belongsTo('App\User','user_id','id');
    }
}
