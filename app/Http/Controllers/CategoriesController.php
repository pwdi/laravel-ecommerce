<?php

namespace App\Http\Controllers;


use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Category;
use Illuminate\Http\Request;


class CategoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::all();
        return view('categories.index', compact('categories'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $category = Category::findOrFail($id);
        $filters = $request->all();

        $products = $this->_getCategoryProductsQuery($category, $filters)->get();
        /* TODO: sort products after filtering */

        return view('categories.show', compact('category', 'products', 'filters'));
    }

    protected function _getCategoryProductsQuery($category, $filters) {
        $productQuery = $category->products();

        /* TODO NEXT: навести красоту тут. А то уродливо */

        // sequentially apply all filters
        /* TODO: filter not only by EAV attributes, but also by attributes common for all products */
        $category_attributes = array($category->attributes);
        foreach ($filters as $attribute_code => $filter_value) {
            // if filter_value not empty and filter attribute code is correct (code of one of category attributes)
            //   apply filter
            if ($filter_value && in_array($attribute_code, array_keys($category_attributes))) {

                // if filter is a range
                if (strpos($attribute_code, 'min_') !== false) {
                    $attribute_code = substr($attribute_code, 4);
                    $productQuery->whereHas($attribute_code, function ($query) use ($filter_value)  {
                        $query->where('content', '>=', $filter_value);
                    });
                }
                elseif (strpos($attribute_code, 'max_') !== false) {
                    $attribute_code = substr($attribute_code, 4);
                    $productQuery->whereHas($attribute_code, function ($query) use ($filter_value)  {
                        $query->where('content', '<=', $filter_value);
                    });
                }
                else {
                    // query by EAV attribute
                    $productQuery->whereHas($attribute_code, function ($query) use ($filter_value)  {
                        // if there're multiple values, combine them with OR
                        if (is_array($filter_value)) {
                            // foreach ($filter_value as $value) {
                                $query->whereIn('content', $filter_value);
                            // }
                        }
                        else {
                            $query->where('content', $filter_value);
                        }
                    });
                }
            }
        }

        // echo $productQuery->toSql();
        // echo "<br>";
        // print_r($productQuery->getBindings());
        // echo "<hr>";

        return $productQuery;
    }
}
