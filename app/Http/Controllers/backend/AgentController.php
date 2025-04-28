<?php

namespace App\Http\Controllers\backend;

use App\Models\Agent;
use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;
use Hash;
use Auth;

class AgentController extends Controller
{
    protected $breadcrumb;
    public function __construct(){$this->breadcrumb = ['title'=>'Agents'];}
    public function index()
    {
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.agents.index', compact('data'));
    }
    public function createOrEdit($id=null)
    {
        if($id){
            $data['title'] = 'Edit';
            $data['item'] = Agent::find($id);
        }else{
            $data['title'] = 'Create';
        }
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.agents.create-edit',compact('data'));
    }
    public function store(Request $request)
    {
        $data = $request->all();
        $admin = Admin::where('email',$data['email'])->first();
        if($admin){
            return redirect()->back()->with('alert',['messageType'=>'danger','message'=>'This email is already exists!']);
        }
        $data['created_by_id'] = $this->getUserId();
        $investor = Agent::create($data);

        $admins['investor_id'] = $investor->id;
        $admins['password'] = Hash::make('12345');
        $admins['name'] = $data['name'];
        $admins['type'] = 2;
        $admins['mobile'] = $data['contact'];
        $admins['email'] = $data['email'];
        $admins['status'] = 0;
        Admin::create($admins);

        return redirect()->route('agents.index')->with('alert',['messageType'=>'success','message'=>'Data Inserted Successfully!']);
    }

    public function update(Request $request,$id)
    {
        $data = $request->all();
        $data['updated_by_id'] = $this->getUserId();
        Agent::find($id)->update($data);
        return redirect()->route('agents.index')->with('alert',['messageType'=>'success','message'=>'User Updated Successfully!']);
    }
    
 
    public function list(Request $request)
    {
        $query = Agent::query();
                    if(!$request->has('order')) $query = $query->orderBy('id','desc');
        return DataTables::of($query)->make(true);
    }

}
