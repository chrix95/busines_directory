@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-3">
            @include('_partials.navbar')
        </div>
        <div class="col-md-9">
            <card-listing-component :business="{{ $listing }}"></card-listing-component>
        </div>
    </div>
</div>
@endsection
