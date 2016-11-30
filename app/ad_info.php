<?php

namespace Lappy;

use Illuminate\Database\Eloquent\Model;

class ad_info extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'ad_info';

    //primary key ad_id

    protected $primaryKey = 'ad_id';

    public $timestamps = false;

}
