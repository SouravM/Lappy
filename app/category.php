<?php

namespace Lappy;

use Illuminate\Database\Eloquent\Model;

class category extends Model
{
    //

    protected $table = 'category';

    public $timestamps = false;

    protected $primaryKey = 'category_id';

    public $incrementing = false;



}
