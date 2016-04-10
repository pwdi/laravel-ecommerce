<?php

namespace App\Eav\Attribute;

use Illuminate\Database\Eloquent\Model;

class Option extends Model
{
    var $table = 'eav_attribute_options';

    protected $fillable = [
        'label',
    ];

    /* TODO: relation with EAV attribute*/
}