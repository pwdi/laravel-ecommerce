@extends('layout')

@section('content')

<div class="row">
    <ol class="breadcrumb">
        <li><a href="{{ route('categories.index') }}">Home</a></li>
        <li><a href="{{ route('categories.show', $product->category->id) }}">{{ $product->category->name }}</a></li>
        <li class="active">{{ $product->name }}</li>
    </ol>
</div>

<div class="row">

    <h2>{{ $product->name }}</h2>
    <h4>${{ $product->price }}</h4>
    <p>
        SKU: {{ $product->sku }}
    </p>
    <p>
        <button type="button" class="btn btn-primary">Buy</button>
    </p>

    @foreach ($product->category_attributes as $attribute)
        <p>
            <b>{{ $attribute->label }}</b>:

            <!-- If it's a special option attribute, display in a special way -->
            <!-- TODO: remove model class hardcode -->
            @if ($attribute->model == 'App\Eav\Value\Data\Option')
                <!-- If it's a multiselect, -->
                @if ($attribute->collection)
                    @foreach ($product->{$attribute->code} as $option)
                        {{ $option->label }},
                    @endforeach
                @else
                    {{ $product->{$attribute->code}->label }}
                @endif
            @else
                <!-- Otherwise just display value -->
                <!-- TODO: display different types differently (especially date)
                           maybe, option model (varchar/int/datetime) will decide how to display value
                -->
                {{ $product->{$attribute->code} }}
            @endif
        </p>
    @endforeach

    <p></p>
    <div class="well">
        {{ $product->description }}
    </div>
</div>
@stop