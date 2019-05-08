<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class FlatPartUser extends Pivot
{
    protected $fillable = [
        'brightness_percentage',
        'reacts_to_movements',
        'turn_off_timer',
        'color',
    ];

    protected $attributes = [
        'color' => '#FFFFFF',
    ];

    public $timestamps = false;

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function flatPart()
    {
        return $this->belongsTo(FlatPart::class);
    }
}
