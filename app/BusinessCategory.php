<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BusinessCategory extends Model
{
    //
    protected $fillable = [
        'business_id',
        'category_id'
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
        'category'
    ];

    public function category () {
        return $this->hasOne('App\Category', 'id', 'category_id');
    }

    public function business () {
        return $this->belongsTo('App\Business');
    }
}
