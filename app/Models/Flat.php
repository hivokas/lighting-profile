<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Flat extends Model
{
    protected $fillable = [
        'name',
    ];

    public function flatType()
    {
        return $this->belongsTo(FlatType::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
