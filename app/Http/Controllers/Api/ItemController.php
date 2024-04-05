<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ItemRequest;
use App\Http\Requests\ItemUpdateRequest;
use App\Http\Resources\ItemListResource;
use App\Http\Resources\ItemResource;
use App\Http\Resources\ItemStoreResource;
use App\Http\Resources\ItemUpdateResource;
use App\Models\Inventory;
use App\Models\Item;
use Auth;
use Exception;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;


class ItemController extends Controller
{
    public function index(Inventory $inventory)
    {
        try {
            $item = $inventory->items;
            return response()->json(ItemListResource::collection($item));
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function store(ItemRequest $request)
    {
        // dd($request->hasFile('image'));
        try {
            $validateData = $request->validated();
            if ($request->image) {

                $imageData = $request->input('image'); // Assuming 'image' is the key for the base64 string in the request

                list($type, $imageData) = explode(';', $imageData);
                list(, $imageData)      = explode(',', $imageData);

                $imageData = base64_decode($imageData);
                $filename = 'image_' . time() . '.' . explode('/', $type)[1];
                Storage::disk('public')->put($filename, $imageData);
                $validateData['image'] = $filename;
            }
            $item = Item::create($validateData);
            return response()->json(new ItemStoreResource($item));
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function show($id)
    {
        $item = Item::where('id', $id)->first();
        return response()->json($item);
    }

    public function update(ItemUpdateRequest $request, $id)
    {

        try {
            $item = Item::findOrFail($id);
            $request->validated();

            $item->name = $request->name;
            $item->description = $request->description;
            $item->quantity = $request->quantity;

            if ($request->new_image) {

                Storage::disk('public')->delete($item->image);
                $imageData = $request->input('new_image'); // Assuming 'image' is the key for the base64 string in the request

                list($type, $imageData) = explode(';', $imageData);
                list(, $imageData)      = explode(',', $imageData);

                $imageData = base64_decode($imageData);
                $filename = 'image_' . time() . '.' . explode('/', $type)[1];
                Storage::disk('public')->put($filename, $imageData);
                $item->image = $filename;
            }

            $item->save();
            return response()->json(new ItemUpdateResource($item));
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $item = Item::where('id', $id)->first();
            $item->delete();
            return response()->json(['message' => "Item Deleted Successfully"]);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
