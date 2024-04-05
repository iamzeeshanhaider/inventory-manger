<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    protected $fillable = ['name', 'image', 'description', 'quantity', 'inventory_id'];
    use HasFactory;

    public function inventory()
    {
        return $this->belongsTo(Inventory::class);
    }
}
