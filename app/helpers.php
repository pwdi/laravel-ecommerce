<?php

function is_option_checked($attribute, $option, $filters) {

    // if attribute was filtered at all
    if (isset($filters[$attribute->code])) {
        $filter_value = $filters[$attribute->code]; // can be array or single

        // if attribute was filtered by several options, check that current option is in these 'several' ones
        if (is_array($filter_value)) {
            if (in_array($option->id, $filters[$attribute->code])) {
                return true;
            }
        }
        // if filter is simply an integer, compare it with option id
        else {
            if ($option->id == $filters[$attribute->code]) {
                return true;
            }
        }
    }
    return false;
}