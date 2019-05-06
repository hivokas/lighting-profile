<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FlatPart extends Model
{
    protected $fillable = [
        'name',
    ];

    public function flatType()
    {
        return $this->belongsTo(FlatType::class);
    }

    public function users()
    {
        return $this->belongsToMany(User::class)
            ->withPivot([
                'brightness_percentage',
                'reacts_to_movements',
                'turn_off_timer',
                'color',
            ])
            ->using(FlatPartUser::class);
    }
}
