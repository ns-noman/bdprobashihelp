<?php

namespace App\Http\Controllers\backend;

use App\Models\Customer;
use App\Models\BasicInfo;
use App\Models\CustomerLedger;
use App\Models\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use Hash;

class CustomerController extends Controller
{
    protected $breadcrumb;
    public function __construct(){$this->breadcrumb = ['title'=>'Agents'];}
    public function index()
    {
        $data['customers'] = Customer::orderBy('id', 'desc')->get();
        $data['currency_symbol'] = BasicInfo::first()->currency_symbol;
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.customers.index', compact('data'));
    }

    public function createOrEdit($id=null)
    {
        if($id){
            $data['title'] = 'Edit';
            $data['item'] = Customer::find($id);
        }else{
            $data['title'] = 'Create';
        }
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.customers.create-or-edit',compact('data'));
    }

    public function store(Request $request)
    {
        //Customer Create**********
        $data = $request->all();
        $data['created_by_id'] = Auth::guard('admin')->user()->id;
        $customer = Customer::create($data);
        //End

        $admin = Admin::where('email',$data['email'])->first();
        if($admin){
            return redirect()->back()->with('alert',['messageType'=>'danger','message'=>'This email is already exists!']);
        }

        $admins['agent_id'] = $customer->id;
        $admins['password'] = Hash::make('12345');
        $admins['name'] = $data['name'];
        $admins['type'] = 2;
        $admins['mobile'] = $data['phone'];
        $admins['email'] = $data['email'];
        $admins['status'] = 0;
        Admin::create($admins);


        //Customer Ledger Payment Create**********
        if(isset($data['opening_payable']) && $data['opening_payable'])
        {
            $customerLedgerData['customer_id'] = $customer->id;
            $customerLedgerData['particular'] = 'Opening Payable';
            $customerLedgerData['date'] = date('Y-m-d');
            $customerLedgerData['credit_amount'] = null;
            $customerLedgerData['debit_amount'] = $data['opening_payable'];
            $customerLedgerData['created_by_id'] = Auth::guard('admin')->user()->id;
            $this->customerLedgerTransction($customerLedgerData);
        }
        if(isset($data['opening_receivable']) && $data['opening_receivable'])
        {
            $customerLedgerData['customer_id'] = $customer->id;
            $customerLedgerData['particular'] = 'Opening Receivable';
            $customerLedgerData['date'] = date('Y-m-d');
            $customerLedgerData['credit_amount'] = $data['opening_receivable'];
            $customerLedgerData['debit_amount'] = null;
            $customerLedgerData['created_by_id'] = Auth::guard('admin')->user()->id;
            $this->customerLedgerTransction($customerLedgerData);
        }
        //End
        return redirect()->route('customers.index')->with('alert',['messageType'=>'success','message'=>'Data Inserted Successfully!']);
    }


    public function update(Request $request, $id)
    {
        $customer = Customer::find($id);
        $data = $request->all();
        $data['created_by_id'] = Auth::guard('admin')->user()->id;
        $customer->update($data);
        return redirect()->route('customers.index')->with('alert',['messageType'=>'success','message'=>'Data Updated Successfully!']);
    }
    
    public function destroy($id)
    {
        $customer = Customer::find($id);
        if(count($data)) return redirect()->back()->with('alert',['messageType'=>'warning','message'=>'Data Deletion Failed!']);
        $customer->delete();
        return redirect()->back()->with('alert',['messageType'=>'success','message'=>'Data Deleted Successfully!']);
    }
}
