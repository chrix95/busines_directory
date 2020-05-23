<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Business extends Model
{
    //
    protected $fillable =  [
        'name',
        'phone',
        'address',
        'description',
        'email',
        'image',
        'website',
        'views',
        'category',
        'rating',
        'status'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'created_at', 'updated_at'
    ];

    protected $with = [
        'businesscategory', 'images', 'ratings'
    ];

    public function businesscategory () {
        return $this->hasMany('App\BusinessCategory');
    }

    public function images () {
        return $this->hasMany('App\Image');
    }

    public function ratings () {
        return $this->hasMany('App\Rating');
    }
}
