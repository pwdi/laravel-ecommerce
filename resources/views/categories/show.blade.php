@extends('layout')

@section('content')
<div class="row">
  <ol class="breadcrumb">
      <li><a href="{{ route('categories.index') }}">Home</a></li>
      <li class="active">{{ $category->name }}</li>
  </ol>
</div>
<div class="row">
    <div class="col-md-4">
        <legend>Filters</legend>
        <form>
            @foreach ($category->attributes as $attribute)
                <p>
                    <b>{{ $attribute->label }}</b>

                    <!-- If it's a special option attribute, display in a special way -->
                    <!-- TODO: remove model class hardcode -->
                    @if ($attribute->model == 'App\Eav\Value\Data\Option')
                        <!-- If it's a multiselect, -->
                            @foreach ($attribute->options as $option)
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="{{ $attribute->code }}[]" value="{{ $option->id }}">
                                        {{ $option->label }}
                                    </label>
                                </div>
                            @endforeach
                    @else
                        <!-- Otherwise just display text input -->
                        <!-- TODO: display different types differently (especially date)
                                   maybe, option model (varchar/int/datetime) will decide how to display value
                        -->
                        @if ($attribute->model == 'Devio\Eavquent\Value\Data\Integer')
                            <div class="form-group">
                                From
                                <input type="number" class="form-control" id="{{ $attribute->code }}">

                                To
                                <input type="number" class="form-control" id="{{ $attribute->code }}">
                            </div>
                        @else
                            <input type="text" class="form-control" id="{{ $attribute->code }}">
                        @endif
                    @endif
                </p>
                <hr>
            @endforeach
        </form>
    </div>
    <div class="col-md-8">
        @include('products/partials/list', ['products' => $category->products])
    </div>
</div>

@stop