<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ItemUpdateResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'message' => 'Item updated successfully',
            'status' => 'success',
            'code' => 200,
            'data' => [
                'id' => $this->id,
                'name' => $this->name,
                'description' => $this->description,
                'image' => $this->image,
                'quantity' => $this->quantity,
                'inventory_id' => $this->inventory_id,
            ],
        ];
    }
}
