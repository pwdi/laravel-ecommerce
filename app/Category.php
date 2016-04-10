<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = [
        'name',
    ];

    // public function attributes()
    // {
        // return $this->hasMany('\Devio\Eavquent\Attribute\Attribute');
    // }
}
