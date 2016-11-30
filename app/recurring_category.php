<?php

namespace Lappy;

use Illuminate\Database\Eloquent\Model;

class recurring_category extends Model
{
    //

    protected $table = 'recurring_category';

    public $timestamps = false;

    protected $primaryKey = 'user_id';

    public $incrementing = false;
}
