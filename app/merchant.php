<?php

namespace Lappy;

use Illuminate\Database\Eloquent\Model;

class merchant extends Model
{
    //

    protected $table = 'merchant';

    public $timestamps = false;

    protected $primaryKey = 'merchant_id';

    public $incrementing = false;

}
