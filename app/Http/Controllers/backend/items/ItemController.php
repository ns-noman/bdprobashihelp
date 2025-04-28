<?php

namespace App\Http\Controllers\backend\items;

use App\Models\Item;
use App\Models\StockHistory;
use App\Models\Unit;
use App\Models\Category;
use App\Models\CategoryType;
use App\Models\BasicInfo;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Yajra\DataTables\Facades\DataTables;
use Auth;

class ItemController extends Controller
{
    protected $breadcrumb;
    public function __construct(){$this->breadcrumb = ['title'=>'Service Items'];}
    public function index()
    {
        $data['category_types'] = CategoryType::get();
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.items.items.index',compact('data'));
    }

    public function createOrEdit($id=null)
    {
        if($id){
            $data['title'] = 'Edit';
            $data['item'] = Item::find($id);
        }else{
            $data['title'] = 'Create';
        }
        $data['package_items'] = Item::where('item_type','0')->get();
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.items.items.create-or-edit', compact('data'));
    }

    public function store(Request $request)
    {
        $data = $request->all();
        $item = Item::create($data);
        foreach ($data['package_item_ids'] as $key => $package_item_id) {
            Item::create(
            [
                'package_id'=> $item->id,
                'package_item_id'=> $package_item_id,
            ]);
        }
        return redirect()->route('items.index')->with('alert',['messageType'=>'success','message'=>'Data Inserted Successfully!']);
    }

    

    public function update(Request $request,$id)
    {
        $item = Item::find($id);
        $data = $request->all();
        $item->update($data);
        return redirect()->route('items.index')->with('alert',['messageType'=>'warning','message'=>'Data Updated Successfully!']);
    }

    public function destroy($id)
    {
        Item::destroy($id);
        return redirect()->back()->with('alert',['messageType'=>'success','message'=>'Data Deleted Successfully!']);
    }
    
    public function list(Request $request)
    {
        $item_type = $request->item_type;
        $select = 
        [
            'items.id',
            'items.name',
            'items.item_type',
            'items.purchase_price',
            'items.sale_price',
            'items.vat',
            'items.status',
        ];
        $query = Item::query();
        if($item_type){
            $query = $query->where('items.item_type', $item_type);
        }else{
            $query = $query->where('items.item_type','!=', null);
        }
        $query = $query->select($select);
        if(!$request->has('order')) $query = $query->orderBy('items.id','desc');
        return DataTables::of($query)->make(true);
    }
}
