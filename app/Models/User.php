<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use Notifiable,
        HasApiTokens;

    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = bcrypt($value);
    }

    public function flatTypes()
    {
        return $this->belongsToMany(FlatType::class);
    }

    public function flatParts()
    {
        return $this->belongsToMany(FlatPart::class)
            ->withPivot([
                'brightness_percentage',
                'reacts_to_movements',
                'turn_off_timer',
                'color',
            ])
            ->using(FlatPartUser::class);
    }

    public function flats()
    {
        return $this->hasMany(Flat::class);
    }
}
