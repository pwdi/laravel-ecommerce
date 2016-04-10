@extends('layout')

@section('content')

@foreach ($categories as $category)
    <div>
        <h2><a href="{{ route('categories.show', $category->id)}}"> {{ $category->name }}</a></h2>
    </div>
    <hr>
@endforeach

@stop