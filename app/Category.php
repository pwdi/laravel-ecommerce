<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = [
        'name',
    ];

    // TODO: backward relation. For this, we should implement our own attribute model that extends original one
    public function attributes()
    {
        return $this->belongsToMany('\Devio\Eavquent\Attribute\Attribute', 'category_attribute');
    }
}
