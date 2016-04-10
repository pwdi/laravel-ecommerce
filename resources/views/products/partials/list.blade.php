@foreach ($products as $product)
    <div>
        <h2><a href="{{ route('products.show', $product->id)}}"> {{ $product->name }}</a></h2>
        <h3>${{ $product->price }}</h3>
        <form action="#">
            <button type="button" class="btn btn-primary">Buy</button>
        </form>
    </div>
    <hr>
@endforeach