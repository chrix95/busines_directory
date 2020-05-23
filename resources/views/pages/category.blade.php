@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-3">
            @include('_partials.navbar')
        </div>
        <div class="col-md-9">
            <div class="card">
                <div class="card-header">Category</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    <category-component :category="{{ $category }}"></category-component>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
