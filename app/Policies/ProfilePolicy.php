<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Profile;
use Illuminate\Auth\Access\HandlesAuthorization;

class ProfilePolicy
{
    use HandlesAuthorization;

    public function view(User $user, Profile $profile)
    {
        return $profile->user_id == $user->id;
    }

    public function create(User $user)
    {
        return true;
    }

    public function update(User $user, Profile $profile)
    {
        return $profile->user_id == $user->id;
    }

    public function delete(User $user, Profile $profile)
    {
        return $profile->user_id == $user->id;
    }

    public function restore(User $user, Profile $profile)
    {
        return $profile->user_id == $user->id;
    }

    public function forceDelete(User $user, Profile $profile)
    {
        return $profile->user_id == $user->id;
    }
}
