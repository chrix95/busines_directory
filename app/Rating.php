<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rating extends Model
{
    //
    protected $fillable = [
        'business_id',
        'rating'
    ];

    protected $hidden = [
        'created_at', 'updated_at'
    ];
}
