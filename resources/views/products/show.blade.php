@extends('layout')

@section('content')

<div>
    <h2>{{ $product->name }}</h2>
    <h4>${{ $product->price }}</h4>
    <p>
        SKU: {{ $product->sku }}
    </p>
    <p>
        <button type="button" class="btn btn-primary">Buy</button>
    </p>
</div>

@foreach ($product->getEntityAttributes() as $attribute_code => $attribute)
    <p>
        <b>{{ $attribute->label }}</b>:


        <!-- If it's a special option attribute, display in a special way -->
        <!-- TODO: remove model class hardcode -->
        @if ($attribute->model == 'App\Eav\Value\Data\Option')
            <!-- If it's a multiselect, -->
            @if ($attribute->collection)
                @foreach ($product->{$attribute_code} as $option)
                    {{ $option->label }},
                @endforeach
            @else
                {{ $product->{$attribute_code}->label }}
            @endif
        @else
            <!-- Otherwise just display value -->
            <!-- TODO: display different types differently (especially date)
                       maybe, option model (varchar/int/datetime) will decide how to display value
            -->
            {{ $product->{$attribute_code} }}
        @endif
    </p>
@endforeach

<p></p>
<div class="well">
    {{ $product->description }}
</div>

@stop