<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class FlatTypeUser extends Pivot
{
    public $timestamps = false;

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function flatType()
    {
        return $this->belongsTo(FlatType::class);
    }
}
