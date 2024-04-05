<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Expense;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    public function todaySell()
    {
        $date = date('d/m/Y');

        $sell = Order::where('order_date',$date)->sum('total');
        return response()->json($sell);
    }
    public function todayIncome()
    {
        $date = date('d/m/Y');

        $income = Order::where('order_date',$date)->sum('pay');
        return response()->json($income);
    }
    public function todayDue()
    {
        $date = date('d/m/Y');

        $due = Order::where('order_date',$date)->sum('due');
        return response()->json($due);
    }
    public function todayExpense()
    {
        $date = date('Y-m-d');

        $expense = Expense::where('expense_date',$date)->sum('amount');
        return response()->json($expense);
    }
    public function stockOut()
    {
        $product = Product::where('quantity','<','1')->get();
        // $product = DB::table('products')->where('quantity','<','1')->get();
        return response()->json($product);
    }
}
