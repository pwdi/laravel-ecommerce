<?php

namespace App\Http\Controllers;


use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Product;
// use App\Category;

use Devio\Eavquent\Value\Data\Varchar;
use Devio\Eavquent\Attribute\Attribute;

use App\Eav\Value\Data\Option;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Product::all();
        return view('products.index', compact('products'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $product = Product::findOrFail($id);

        // eager load product attributes
        $product->with('eav');

        return view('products.show', compact('product'));
    }
}
