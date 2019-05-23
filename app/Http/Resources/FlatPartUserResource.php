<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class FlatPartUserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'brightness_percentage' => $this->brightness_percentage,
            'reacts_to_movements' => $this->reacts_to_movements,
            'turn_off_timer' => $this->turn_off_timer,
            'color' => $this->color,
        ];
    }
}
