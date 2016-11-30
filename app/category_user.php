<?php

namespace Lappy;

use Illuminate\Database\Eloquent\Model;

class category_user extends Model
{
    //
    protected $table = 'category_user';

    public $timestamps = false;

    protected $primaryKey = 'user_id';

    public $incrementing = false;

}
