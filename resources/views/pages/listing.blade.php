@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-3">
            @include('_partials.navbar')
        </div>
        <div class="col-md-9">
            <div class="card">
                <div class="card-body">
                    <div class="row justify-content-center">
                        <div class="col-md-4">
                            <img class="card-img-top img-responsive" src="{{ asset($listing->image) }}" alt="{{ $listing->name }}">
                        </div>
                        @foreach ($listing->images as $item)
                            <div class="col-md-4">
                                <img class="card-img-top img-responsive" src="{{ asset($item->image) }}" alt="{{ $listing->name }}">
                            </div>
                        @endforeach
                    </div>
                    <br>
                    <div class="card-title text-center">
                        <h3>
                            <strong>
                                {{ strtoupper($listing->name) }}
                            </strong>
                        </h3>
                        <h5>
                            {{ $listing->address }} <br>
                            {{ $listing->phone }} || {{ $listing->email}}
                        </h5>
                    </div>
                    <h5 class="card-text">
                        <strong>Description: </strong> {{ $listing->description }}
                    </h5>
                    <h5>
                        <strong>Website: </strong> {{ $listing->website }}
                    </h5>
                    <h5>
                        <strong>Rating: </strong> {{ $listing->rating }}
                    </h5>
                    <h5>
                        <strong>Views: </strong> {{ $listing->views }}
                    </h5>
                    <h5>
                        <strong>Status: </strong> {{ $listing->status }}
                    </h5>
                    <h5>
                        <strong>Category: </strong>
                        @foreach ($listing->businesscategory as $item)
                            {{ $item->category->name }}, 
                        @endforeach
                    </h5>
                    <br><br>
                    <a href="{{ route('business.index') }}">
                        <button type="button" class="btn btn-outline-success btn-sm btn-block">
                            Back to list
                        </button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
