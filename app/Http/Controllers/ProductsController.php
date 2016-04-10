<?php

namespace App\Http\Controllers;


use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Product;
// use App\Category;

use Devio\Eavquent\Value\Data\Varchar;
use Devio\Eavquent\Attribute\Attribute;
use Faker\Factory;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $articles = Article::with(['user','category', 'comments', 'views', 'stars']);

        // $sort = Request::get('sort');
        // if ($sort == 'most-commented')   $articles = $articles->mostCommented();
        // elseif ($sort == 'most-viewed')  $articles = $articles->mostViewed();
        // elseif ($sort == 'most-starred') $articles = $articles->mostStarred();
        // else {
        //     $sort = '';
        //     $articles = $articles->recent();
        // }

        // if ($category_id = Request::get('cat'))
        // {
        //     $articles->filterBy(['category_id' => $category_id]);
        // }

        // $articles = $articles->paginate(Config::get('frontend.articles_per_page'));

        // return view('articles.index', compact('articles'));
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
        // $article = Article::findOrFail($id);

        // $view = new View(['user_id' => Auth::check() ? Auth::user()->id : null]) ;
        // $article->views()->save($view);
        // return view('articles.show', compact('article'));
    }


    public function createDummyData()
    {
        // $faker = Factory::create();

        // // Simple attribute with values
        // $cityAttribute = Attribute::create([
        //     'code'          => 'city',
        //     'label'         => 'City',
        //     'model'         => Varchar::class,
        //     'entity'        => Product::class,
        //     'default_value' => null
        // ]);

        // // Collection attribute with values
        // $colorsAttribute = Attribute::create([
        //     'code'          => 'colors',
        //     'label'         => 'Colors',
        //     'model'         => Varchar::class,
        //     'entity'        => Product::class,
        //     'default_value' => null,
        //     'collection'    => true
        // ]);

        // // Simple attribute without any value
        // $addressAttribute = Attribute::create([
        //     'code'          => 'address',
        //     'label'         => 'Address',
        //     'model'         => Varchar::class,
        //     'entity'        => Product::class,
        //     'default_value' => null
        // ]);

        // // Collection attribute without any value
        // $sizesAttribute = Attribute::create([
        //     'code'          => 'sizes',
        //     'label'         => 'Sizes',
        //     'model'         => Varchar::class,
        //     'entity'        => Product::class,
        //     'default_value' => null,
        //     'collection'    => true
        // ]);

        $product = Product::first();
        // $product->colors = ['foo', 'bar'];
        // $product->city = 'Kharkiv';
        $product->save();
        var_dump($product->city);
        var_dump($product->colors);
        return view('products.index', ['products' => [$product]]);
    }

}
