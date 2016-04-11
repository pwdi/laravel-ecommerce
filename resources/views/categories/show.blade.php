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
        <form id="category-filter-form" action="{{ route('categories.show', $category->id) }}">

            <!-- TODO: not use '_' but '-' in GET params -->

            <!-- TODO: filter by common attributes (not only by EAV, but by price, qty etc) -->
<!--             <b>Price</b>
            <div class="form-group">
                From
                <input type="number" class="form-control" name="min_price">

                To
                <input type="number" class="form-control" name="max_price">
            </div>
 -->
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
                                        <!-- TODO: user JS to render this stuff -->
                                        <input type="checkbox" name="{{ $attribute->code }}[]" value="{{ $option->id }}"
                                               {{ is_option_checked($attribute, $option, $filters) ? 'checked' : '' }} >
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
                                <input type="number" class="form-control"
                                       name="min_{{ $attribute->code }}"
                                       value="{{ isset($filters['min_'.$attribute->code]) ? $filters['min_'.$attribute->code] : '' }}">

                                To
                                <input type="number" class="form-control"
                                       name="max_{{ $attribute->code }}"
                                       value="{{ isset($filters['max_'.$attribute->code]) ? $filters['max_'.$attribute->code] : '' }}">
                            </div>
                        @else
                            <input type="text" class="form-control" id="{{ $attribute->code }}">
                        @endif
                    @endif
                </p>
                <hr>
            @endforeach

            <div class="text-center">
                <button type="submit" class="btn btn-primary">Apply filters</button>
            </div>
        </form>
    </div>
    <div class="col-md-8">
        @include('products/partials/list', ['products' => $products])
    </div>
</div>

<script type="text/javascript">
    // TODO: send form with JS. It's needed to prevent sending empty fields
</script>
@stop