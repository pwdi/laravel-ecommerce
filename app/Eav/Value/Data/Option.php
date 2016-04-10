<?php
namespace App\Eav\Value\Data;

use Devio\Eavquent\Value\Value;

class Option extends Value
{
    public function setContent($content)
    {
        return $this->setAttribute('content', $content);
    }

    /**
     * Get the content.
     *
     * @return mixed
     */
    public function getContent()
    {
        return $this->belongsTo('App\Eav\Attribute\Option', 'content')->first();
    }
}
