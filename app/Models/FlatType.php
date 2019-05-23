<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FlatType extends Model
{
    protected $fillable = [
        'name',
    ];

    public function users()
    {
        return $this->belongsToMany(User::class);
    }

    public function flatParts()
    {
        return $this->hasMany(FlatPart::class);
    }

    public function flats()
    {
        return $this->hasMany(Flat::class);
    }
}
