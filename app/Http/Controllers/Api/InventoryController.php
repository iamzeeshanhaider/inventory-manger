<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\InventoryRequest;
use App\Http\Requests\InventoryUpdateRequest;
use App\Http\Resources\InventoryGetResource;
use App\Http\Resources\InventoryListResource;
use App\Http\Resources\InventoryResource;
use App\Http\Resources\InventoryUpdateResource;
use App\Models\Inventory;
use Illuminate\Http\Request;
use Auth;
use Exception;
use Illuminate\Support\Facades\Log;

class InventoryController extends Controller
{
    public function index()
    {
        try {
            $inventory = Auth()->user()->inventory;
            return response()->json(InventoryListResource::collection($inventory));
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function store(InventoryRequest $request)
    {
        try {
            $validateData = $request->validated();
            $validateData['user_id'] = Auth::user()->id;
            $inventory = Inventory::create($validateData);
            // dd($inventory);
            return response()->json(new InventoryResource($inventory));
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return response()->json(['error' => 'There was a problem creating the inventory'], 500);
        }
    }


    public function show($id)
    {
        try {
            $inventory = Inventory::where('id', $id)->first();
            return response()->json(new InventoryGetResource($inventory));
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(InventoryUpdateRequest $request, $id)
    {
        try {
            $inventory = Inventory::findOrFail($id);
            $request->validated();
            $inventory->name = $request->name;
            $inventory->description = $request->description;
            $inventory->save();
            return response()->json(new InventoryUpdateResource($inventory));
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return response()->json(['error' => 'There was a problem updating the inventory'], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $inventory = Inventory::where('id', $id)->first();
            $inventory->delete();
            return response()->json(['message' => "Inventory Deleted Successfully"]);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return response()->json(['error' => 'There was a problem In deleting Inventory'], 500);
        }
    }
}
