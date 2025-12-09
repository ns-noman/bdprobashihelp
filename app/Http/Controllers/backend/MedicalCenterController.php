<?php

namespace App\Http\Controllers\backend;

use App\Models\MedicalCenter;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;

class MedicalCenterController extends Controller
{
    protected $breadcrumb;
    public function __construct(){$this->breadcrumb = ['title'=>'Medical Centers'];}
    public function index()
    {
        $data['medicals'] = MedicalCenter::with(['parent'])->orderBy('updated_at', 'desc')->get();
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.medical-centers.index', compact('data'));
    }

    public function createOrEdit($id=null)
    {
        if($id){
            $data['title'] = 'Edit';
            $data['item'] = MedicalCenter::find($id);
        }else{
            $data['title'] = 'Create';
        }
        $data['parents'] = MedicalCenter::whereNull('parent_id')->get();
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.medical-centers.create-or-edit',compact('data'));
    }
    
    public function store(Request $request)
    {
        $data = $request->all();
        MedicalCenter::create($data);
        return redirect()->route('medical-centers.index')->with('alert',['messageType'=>'success','message'=>'Data Inserted Successfully!']);
    }


    public function update(Request $request, $id)
    {
        $data = $request->all();
        MedicalCenter::find($id)->update($data);
        return redirect()->route('medical-centers.index')->with('alert',['messageType'=>'success','message'=>'Data Updated Successfully!']);
    }
    
    public function destroy($id)
    {
        try {
            $item = MedicalCenter::findOrFail($id);
            $item->delete();

            return response()->json([
                'messageType' => 'success',
                'message'     => 'Data deleted successfully!'
            ]);
        } catch (\Exception $e) {
            \Log::error('Delete failed: '.$e->getMessage());

            return response()->json([
                'messageType' => 'error',
                'message'     => 'Something went wrong while deleting!'
            ], 500);
        }
    }



}
