<?php

namespace App\Http\Controllers\backend;

use App\Models\Sale;
use App\Models\SaleDetails;
use App\Models\BasicInfo;
use App\Models\CustomerPayment;
use App\Models\Customer;
use App\Models\Item;
use App\Models\JobServiceRecords;
use App\Models\MedicalCenter;
use App\Models\StatusList;
use App\Models\Country;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\File;

use Auth;

class SaleController extends Controller
{
    protected $breadcrumb;
    public function __construct(){$this->breadcrumb = ['title'=>'Jobs'];}
    public function index()
    {
      
        $data['currency_symbol'] = BasicInfo::first()->currency_symbol;
        $data['paymentMethods'] = $this->paymentMethods();
        $data['breadcrumb'] = $this->breadcrumb;
        $data['customers'] = Customer::where('status',1)->orderBy('name','asc')->get();
        return view('backend.jobs.index', compact('data'));
    }

    public function createOrEdit($id=null)
    {
        if($id){
            $data['title'] = 'Edit';
            $data['item'] = Sale::find($id);
            $data['saleDetails'] = SaleDetails::leftJoin('items','items.id','sale_details.item_id')
                                    ->where('sale_details.sale_id',$id)
                                    ->select([
                                        'sale_details.id',
                                        'sale_details.sale_id',
                                        'sale_details.item_id',
                                        'items.name as item_name',
                                        'sale_details.unit_price',
                                    ])
                                    ->get()
                                    ->toArray();

        }else{
            $data['title'] = 'Create';
        }
        $data['paymentMethods'] = $this->paymentMethods();
        $data['currency_symbol'] = BasicInfo::first()->currency_symbol;
        $data['customers'] = Customer::where('status',1)->orderBy('name','asc')->get();

        $items = Item::where('items.status', 1)
                ->whereNotNull('items.item_type')
                ->where('is_saleable', 1)
                ->orderBy('items.name', 'asc')
                ->orderBy('items.item_type', 'desc')
                ->select('items.id', 'items.name', 'items.sale_price as price', 'items.item_type')
                ->get()
                ->toArray();
    
        $data['items'] = $items;
        $data['breadcrumb'] = $this->breadcrumb;
        $data['is_agent'] = Auth::guard('admin')->user()->agent_id ? true : false;
        $data['agent_id'] = Auth::guard('admin')->user()->agent_id;
        $data['countries'] = Country::where('status', '=', 1)->get();
        $data['centers'] = MedicalCenter::where(['status'=>1, 'medical_type'=>1])->orderBy('id','asc')->get()->toArray();
        return view('backend.jobs.create-or-edit',compact('data'));
    }
    public function addNewItem($id=null)
    {
        $data['title'] = 'Add New Item';
        $data['item'] = Sale::find($id);
        $data['paymentMethods'] = $this->paymentMethods();
        $data['currency_symbol'] = BasicInfo::first()->currency_symbol;
        $data['customers'] = Customer::where('status',1)->orderBy('name','asc')->get();

        $items = Item::where('items.status', 1)
                ->whereNotNull('items.item_type')
                ->orderBy('items.item_type', 'desc')
                ->orderBy('items.name', 'asc')
                ->select('items.id', 'items.name', 'items.sale_price as price', 'items.item_type')
                ->get()
                ->toArray();
    
        $data['items'] = $items;
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.jobs.add-new-item',compact('data'));
    }
    public function newStore(Request $request,$id)
    {
        DB::beginTransaction();
        try {
            
            $account_id = $request->account_id;
            $date = $request->date;
            $total_pice = $request->total_price;
            $discount = $request->discount ?? 0;
            $total_payable = $request->total_payable;
            $paid_amount = $request->paid_amount;
            $note = $request->note;
            $reference_number = $request->reference_number;

            $created_by_id = Auth::guard('admin')->user()->id;
            $item_id = $request->item_id;
            $unit_price = $request->unit_price;
    
            $updated_by_id = Auth::guard('admin')->user()->id;
            $sale = Sale::find($id);
            $sale->total_price += $total_pice;
            $sale->total_payable += $total_payable;
            if($discount>0){
                $sale->discount_method = 2;
                $sale->discount += $discount;
                $sale->discount_rate = $sale->discount;
            }

            $sale->paid_amount += $paid_amount;
            $sale->payment_status = ($sale->total_payable == $sale->paid_amount) ? 1 : 0;
            $sale->updated_by_id = $updated_by_id;
            $sale->save();
            for ($i = 0; $i < count($item_id); $i++) {
                $saleDetails = new SaleDetails();
                $saleDetails->sale_id = $sale->id;
                $saleDetails->item_id = $item_id[$i];
                $saleDetails->date = $sale->date;
                $saleDetails->unit_price = $unit_price[$i];
                $saleDetails->save();
            }

            // Customer ledger entry for sale
            $customerLedgerDataSale['customer_id'] = $sale->customer_id;
            $customerLedgerDataSale['sale_id'] = $sale->id;
            $customerLedgerDataSale['particular'] = 'Sale';
            $customerLedgerDataSale['date'] = $date;
            $customerLedgerDataSale['credit_amount'] = $total_payable;
            $customerLedgerDataSale['note'] = $note;
            $customerLedgerDataSale['created_by_id'] = $created_by_id;
            $this->customerLedgerTransction($customerLedgerDataSale);

            if ($paid_amount>0)
            {
            // Account Transaction
                $accountData = [
                    'account_id'        => $account_id,
                    'credit_amount'      => $paid_amount,
                    'reference_number'  => $reference_number,
                    'description'       => 'Sale Payment',
                    'transaction_date'  => $date, 
                ];
                $this->accountTransaction($accountData);

                $payment = new CustomerPayment();
                $payment->customer_id = $sale->customer_id;
                $payment->account_id = $account_id;
                $payment->sale_id = $sale->id;
                $payment->date = $date;
                $payment->amount = $paid_amount;
                $payment->reference_number = $reference_number;
                $payment->note = $note;
                $payment->status = 1;
                $payment->created_by_id = $created_by_id;
                $payment->save();

                $customerLedgerDataPayment['customer_id'] = $sale->customer_id;
                $customerLedgerDataPayment['payment_id'] = $payment->id;
                $customerLedgerDataPayment['account_id'] = $account_id;
                $customerLedgerDataPayment['particular'] = 'Payment';
                $customerLedgerDataPayment['date'] = $date;
                $customerLedgerDataPayment['debit_amount'] = $paid_amount;
                $customerLedgerDataPayment['reference_number'] = $reference_number;
                $customerLedgerDataPayment['note'] = $note;
                $customerLedgerDataPayment['created_by_id'] = $created_by_id;
                $this->customerLedgerTransction($customerLedgerDataPayment);
            }
            $this->updateServiceItemPurchaseFlug($sale->id);
            $this->generateProfit($id);
            DB::commit();
            return redirect()->route('sales.index')->with('alert', ['messageType' => 'success', 'message' => 'Data Inserted Successfully!']);
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert', ['messageType' => 'error', 'message' => 'Something went wrong! ' . $e->getMessage()]);
        }
    }

    public function serviceEdit($saleId, $serviceRecordId)
    {
        $roleType = Auth::guard('admin')->user()->type;
        $customer_id = Auth::guard('admin')->user()->agent_id;
        
        $data['title'] = 'Edit';
        $data['sale'] = Sale::find($saleId)->toArray();
        $data['jobServiceRecord'] = JobServiceRecords::join('items','items.id','job_service_records.item_id')
                                ->where('job_service_records.id',$serviceRecordId)
                                ->select(['job_service_records.*','items.id as item_id','items.name as item_name'])
                                ->first()->toArray();
        $data['customer_name'] = Customer::find($data['sale']['customer_id'])->name;
        $data['statusList'] = StatusList::where('item_id',$data['jobServiceRecord']['item_id']);
        if($customer_id != null){
            $data['statusList'] = $data['statusList']->whereNotNull('name_for_agent');
        }
        $data['statusList'] = $data['statusList']->orderBy('srl', 'asc')->get()->toArray();

        $data['centers'] = MedicalCenter::where(['status'=>1, 'medical_type'=>0])->orderBy('name','asc')->get()->toArray();
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.jobs.service-info',compact('data'));
    }

    public function invoice($id, $print=null)
    {
        $data['breadcrumb'] = $this->breadcrumb;
        $data['print'] = $print;

        $select = 
        [
            'sales.customer_id',
            'sales.account_id',
            'sales.invoice_no',
            'sales.passenger_name',
            'sales.passenger_passport_no',
            'sales.date as sale_date',
            'sales.total_price',
            'sales.discount',
            'sales.vat_tax',
            'sales.total_payable',
            'sales.paid_amount',
            'sales.reference_number',
            'sales.note',
            'sales.payment_status',
            'sales.status',
            'sales.created_by_id',
            'sales.updated_by_id',
            'customers.name as customer_name',
            'customers.phone as customer_contact',
            'customers.email as customer_email',
            'customers.address as customer_address',
            'customers.organization as customer_organization',
            'admins.name as creator_name',
            'accounts.account_no',
            'payment_methods.name as payment_method',
        ];
        $selectDetails = 
        [
            'sale_details.id',
            'sale_details.sale_id',
            'sale_details.item_id',
            'items.name as item_name',
            'sale_details.unit_price',
        ];

        $data['basicInfo'] = BasicInfo::first()->toArray();
        $data['master'] = Sale::join('customers','customers.id','=','sales.customer_id')
                            ->leftJoin('accounts', 'accounts.id', '=', 'sales.account_id')
                            ->leftJoin('payment_methods', 'payment_methods.id', '=', 'accounts.payment_method_id')
                            ->join('admins', 'admins.id', '=', 'sales.created_by_id')
                            ->where('sales.id', $id)
                            ->select($select)
                            ->first()
                            ->toArray();
        $data['details'] = SaleDetails::leftJoin('items','items.id','sale_details.item_id')
                            ->where('sale_details.sale_id',$id)
                            ->select($selectDetails)
                            ->get()
                            ->toArray();
        return view('backend.jobs.invoice',compact('data'));
    }
    public function token($id, $print=null)
    {
        $data['breadcrumb'] = $this->breadcrumb;
        $data['print'] = $print;

       $select = 
        [
            'sales.passenger_name',
            'sales.passenger_passport_no',
            'customers.code as agent_code',
            'countries.country_name',
            'medical_centers.name as medical_name',
            'medical_centers.address as medical_address',
        ];
        $data['basicInfo'] = BasicInfo::first()->toArray();
        

        $data['master'] = Sale::where('sales.id', $id)->leftjoin('medical_centers', 'medical_centers.id', '=', 'sales.medical_id')
                    ->leftJoin('countries', 'countries.id', '=', 'sales.country_id')
                    ->join('customers', 'customers.id', '=', 'sales.customer_id')
                    ->select($select)
                    ->first();
        return view('backend.jobs.pre-medical-token',compact('data'));
    }
    public function payment(Request $request)
    {
        $sale_id = $request->sale_id;
        $date = $request->date;
        $account_id = $request->account_id;
        $amount = $request->amount;
        $note = $request->note;
        $created_by_id = Auth::guard('admin')->user()->id;
        $sale = Sale::find($request->sale_id);
        $customer_id = $sale->customer_id;

        //CustomerPayment Create**********
        $payment = new CustomerPayment();
        $payment->customer_id = $customer_id;
        $payment->account_id = $account_id;
        $payment->sale_id = $sale_id;
        $payment->date = $date;
        $payment->amount = $amount;
        $payment->note = $note;
        $payment->status = 0;
        $payment->created_by_id = $created_by_id;
        $payment->save();
        //End*****

        return redirect()->route('customer-payments.index')->with('alert',['messageType'=>'success','message'=>'Data Inserted Successfully!']);
    }
        public function documentUpload($doc)
    {
        $doc_name = 'doc-'. Str::uuid().'.'.$doc->getClientOriginalExtension();
        $doc->move(public_path('uploads/'. 'passports'), $doc_name);
        return $doc_name;
    }


    public function store(Request $request)
    {
        DB::beginTransaction();
        try {


            $customer_id = $request->customer_id;
            $medical_id = $request->medical_id;
            $country_id = $request->country_id;
            $account_id = $request->account_id ?? null;
            $passenger_name = $request->passenger_name;
            $passenger_passport_no = $request->passenger_passport_no;
            $localhost_no = $request->localhost_no;
            $date = $request->date;
            $total_pice = $request->total_price ?? 0;
            $vat_tax = $request->vat_tax ?? 0;
            $discount_method = $request->discount_method ?? 0;
            $discount_rate = $request->discount_rate ?? 0;
            $discount = $request->discount ?? 0;
            $total_payable = $request->total_payable ?? 0;
            $paid_amount = $request->paid_amount ?? 0;
            $note = $request->note;
            $reference_number = $request->reference_number ?? null;
            $item_id = $request->item_id ?? [];
            $unit_price = $request->unit_price;
            $medical_center_ids = $request->medical_center_ids ?? [];

            $passport_img = $request->passport_img;

            if(isset($passport_img)){
                $passport_img = $this->documentUpload($passport_img);
            }

            $invoice_no = $this->formatNumber(Sale::latest()->limit(1)->max('invoice_no') + 1);
            $created_by_id = Auth::guard('admin')->user()->id;
            // Sale creation
            $sale = new Sale();
            $sale->customer_id = $customer_id;
            $sale->medical_id = $medical_id;
            $sale->country_id = $country_id;
            $sale->passenger_name = $passenger_name;
            $sale->passenger_passport_no = $passenger_passport_no;
            $sale->passport_img = $passport_img;
            $sale->localhost_no = $localhost_no;
            $sale->account_id = $account_id;
            $sale->invoice_no = $invoice_no;
            $sale->date = $date;
            $sale->total_price = $total_pice;
            $sale->vat_tax = $vat_tax;
            $sale->discount_method = $discount_method;
            $sale->discount_rate = $discount_rate;
            $sale->discount = $discount;
            $sale->total_payable = $total_payable;
            $sale->paid_amount = $paid_amount;
            $sale->reference_number = $reference_number;
            $sale->note = $note;
            $sale->payment_status = ($total_payable == $paid_amount) ? 1 : 0;
            $sale->status = 0;
            $sale->created_by_id = $created_by_id;
            $sale->save();

            for ($i = 0; $i < count($item_id); $i++) {
                $saleDetails = new SaleDetails();
                $saleDetails->sale_id = $sale->id;
                $saleDetails->item_id = $item_id[$i];
                $saleDetails->date = $sale->date;
                $saleDetails->unit_price = $unit_price[$i];
                $saleDetails->save();
            }
            $this->generateJobServiceItem($sale->id);
            DB::commit();
            return redirect()->route('sales.index')->with('alert', ['messageType' => 'success', 'message' => 'Data Inserted Successfully!']);
        } catch (\Exception $e) {
            DB::rollback();
            dd($e);
            return redirect()->back()->with('alert', ['messageType' => 'error', 'message' => 'Something went wrong! ' . $e->getMessage()]);
        }
    }

    public function generateJobServiceItem($saleId)
    {
        $item_ids = Item::where('item_type',0)->pluck('id');
        foreach ($item_ids as $key => $item_id) {
            $initialStatusId = StatusList::where(['item_id'=> $item_id,'status_state'=>0])->first()->id;
            $jobserviceRecordData = ['job_id'=>$saleId,'item_id'=>$item_id,'status_id'=>$initialStatusId,'is_enabled'=>0];
            JobServiceRecords::create($jobserviceRecordData);
        }
    }

    public function update(Request $request,$id)
    {
        DB::beginTransaction();
        try {
            if($request->has('customer_id')) $jobMaster['customer_id'] = $request->input('customer_id');
            if($request->has('medical_id')) $jobMaster['medical_id'] = $request->input('medical_id');
            if($request->has('country_id')) $jobMaster['country_id'] = $request->input('country_id');
            if($request->has('account_id')) $jobMaster['account_id'] = $request->input('account_id');
            if($request->has('passenger_name')) $jobMaster['passenger_name'] = $request->input('passenger_name');
            if($request->has('passenger_passport_no')) $jobMaster['passenger_passport_no'] = $request->input('passenger_passport_no');
            if($request->has('localhost_no')) $jobMaster['localhost_no'] = $request->input('localhost_no');
            if($request->has('date')) $jobMaster['date'] = $request->input('date');
            if($request->has('total_price')) $jobMaster['total_pice'] = $request->input('total_price');
            if($request->has('vat_tax')) $jobMaster['vat_tax'] = $request->input('vat_tax');
            if($request->has('discount_method')) $jobMaster['discount_method'] = $request->input('discount_method');
            if($request->has('discount_rate')) $jobMaster['discount_rate'] = $request->input('discount_rate');
            if($request->has('discount')) $jobMaster['discount'] = $request->input('discount');
            if($request->has('total_payable')) $jobMaster['total_payable'] = $request->input('total_payable');
            if($request->has('paid_amount')) $jobMaster['paid_amount'] = $request->input('paid_amount');
            if($request->has('note')) $jobMaster['note'] = $request->input('note');
            if($request->has('reference_number')) $jobMaster['reference_number'] = $request->input('reference_number');
            if($request->has('passport_img')) $jobMaster['passport_img'] = $request->input('passport_img');
            if($request->has('total_payable') && $request->has('paid_amount')) $jobMaster['payment_status'] = ($jobMaster['total_payable'] == $jobMaster['paid_amount']) ? 1 : 0;
            $jobMaster['updated_by_id'] = Auth::guard('admin')->user()->id;
            $sale = Sale::find($id);
            if (isset($jobMaster['passport_img'])) {
                $oldFile = public_path('uploads/passports/' . $sale->passport_img);
                if (!empty($sale->passport_img) && File::exists($oldFile)) {
                    File::delete($oldFile);
                }
                $jobMaster['passport_img'] = $this->documentUpload($jobMaster['passport_img']);
            }
            $sale->update($jobMaster);

            if($request->has('item_id')){
                $item_id = $request->input('item_id');
                $unit_price = $request->input('unit_price');
                SaleDetails::where('sale_id', $id)->delete();
                for ($i = 0; $i < count($item_id); $i++) {
                    $saleDetails = new SaleDetails();
                    $saleDetails->sale_id = $sale->id;
                    $saleDetails->item_id = $item_id[$i];
                    $saleDetails->date = $sale->date;
                    $saleDetails->unit_price = $unit_price[$i];
                    $saleDetails->save();
                }
            }

            DB::commit();
            return redirect()->route('sales.index')->with('alert', ['messageType' => 'success', 'message' => 'Data Updated Successfully!']);
        } catch (\Exception $e) {
            DB::rollback();
            dd($e);
            return redirect()->back()->with('alert', ['messageType' => 'error', 'message' => 'Something went wrong! ' . $e->getMessage()]);
        }
    }
    public function serviceUpdate(Request $request,$id)
    {
        DB::beginTransaction();
        try {
                $data = $request->all();
                $jobServiceRecord = JobServiceRecords::find($id);

                if($jobServiceRecord->item_id == 1 && $data['status_id'] == 2){
                    JobServiceRecords::where('job_id', $jobServiceRecord->job_id)
                        ->whereIn('item_id', [2, 3])
                        ->update(['expire_date'=> $data['expire_date']]);
                }
                if($jobServiceRecord->item_id == 1 && $data['status_id'] == 5){
                    $sale = Sale::find($jobServiceRecord->job_id)->update(['status'=> 3]);// 3 for refunded
                }

                if($jobServiceRecord->item_id == 3 && $data['status_id'] == 16){
                        JobServiceRecords::where('job_id', $jobServiceRecord->job_id)
                        ->whereIn('item_id', [4])
                        ->update(['expire_date'=> $data['expire_date']]);
                        unset($data['entry_date']);
                        unset($data['expire_date']);
                }

                $this->btnControl($id, $data['status_id']);
                
                if(isset($data['medical_center_ids']) && count($data['medical_center_ids'])){
                    $medicalCenterTxt = '';
                    foreach ($data['medical_center_ids'] as $key => $medical_center_id) {
                        $medicalCenter = MedicalCenter::find($medical_center_id);
                        $medicalCenterTxt .= $medicalCenter->id . ':' . $medicalCenter->name . ':' . $medicalCenter->code . (($key+1) < count($data['medical_center_ids']) ? '|' : null);
                    }
                    $data['medical_centers'] = $medicalCenterTxt;

                    if($jobServiceRecord->item_id == 3 && $data['status_id'] == 12){
                        JobServiceRecords::where('job_id', $jobServiceRecord->job_id)
                        ->whereIn('item_id', [4,5])
                        ->update(['medical_centers'=> $medicalCenterTxt]);
                    }
                }
                $jobServiceRecord->update($data);
            DB::commit();
            return redirect()->route('sales.index')->with('alert', ['messageType' => 'success', 'message' => 'Data Inserted Successfully!']);
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert', ['messageType' => 'error', 'message' => 'Something went wrong! ' . $e->getMessage()]);
        }
    }

    public function btnControl($job_service_record_id, $status)
    {
        $current_job_item = JobServiceRecords::find($job_service_record_id);
        if(in_array($status, [5,6,10,16,21,26])){
            $current_job_item->is_enabled = 1;
            $current_job_item->is_complete = 1;
            $current_job_item->save();
            if($status != 5) {
                $next_item_id = Item::find($current_job_item->item_id)->next_item_id;
                if ($next_item_id != 0) {
                    $nextServiceItem = JobServiceRecords::where(['job_id'=> $current_job_item->job_id, 'item_id'=> $next_item_id])->first();
                    $nextServiceItem->is_enabled = 1;
                    $nextServiceItem->save();
                }else{
                    Sale::find($current_job_item->job_id)->update(['status'=> 2]);
                }
            }
        }
    }

    public function approve($id)
    {
        try {
            DB::beginTransaction();

            $sale = Sale::findOrFail($id);

            $customer_id = $sale->customer_id;
            $account_id = $sale->account_id;
            $invoice_no = $sale->invoice_no;
            $date = $sale->date;
            $total_price = $sale->total_price;
            $discount = $sale->discount;
            $vat_tax = $sale->vat_tax;
            $total_payable = $sale->total_payable;
            $paid_amount = $sale->paid_amount;
            $reference_number = $sale->reference_number;
            $note = $sale->note;
            $payment_status = $sale->payment_status;
            $status = $sale->status;
            $created_by_id = $sale->created_by_id;
            $updated_by_id = $sale->updated_by_id;

            $this->generateProfit($id);

            // Customer ledger entry for sale
            $customerLedgerDataSale['customer_id'] = $customer_id;
            $customerLedgerDataSale['sale_id'] = $sale->id;
            $customerLedgerDataSale['particular'] = 'Sale';
            $customerLedgerDataSale['date'] = $date;
            $customerLedgerDataSale['credit_amount'] = $total_payable;
            $customerLedgerDataSale['note'] = $note;
            $customerLedgerDataSale['created_by_id'] = $created_by_id;
            $this->customerLedgerTransction($customerLedgerDataSale);

            if ($paid_amount>0)
            {
            // Account Transaction
                $accountData = [
                    'account_id'        => $account_id,
                    'credit_amount'      => $paid_amount,
                    'reference_number'  => $reference_number,
                    'description'       => 'Sale Payment',
                    'transaction_date'  => $date, 
                ];
                $this->accountTransaction($accountData);

                $payment = new CustomerPayment();
                $payment->customer_id = $customer_id;
                $payment->account_id = $account_id;
                $payment->sale_id = $sale->id;
                $payment->date = $date;
                $payment->amount = $paid_amount;
                $payment->reference_number = $reference_number;
                $payment->note = $note;
                $payment->status = 1;
                $payment->created_by_id = $created_by_id;
                $payment->save();

                $customerLedgerDataPayment['customer_id'] = $customer_id;
                $customerLedgerDataPayment['payment_id'] = $payment->id;
                $customerLedgerDataPayment['account_id'] = $account_id;
                $customerLedgerDataPayment['particular'] = 'Payment';
                $customerLedgerDataPayment['date'] = $date;
                $customerLedgerDataPayment['debit_amount'] = $paid_amount;
                $customerLedgerDataPayment['reference_number'] = $reference_number;
                $customerLedgerDataPayment['note'] = $note;
                $customerLedgerDataPayment['created_by_id'] = $created_by_id;
                $this->customerLedgerTransction($customerLedgerDataPayment);
            }

            
            // Update sale status
            $sale->update(['status' => 1]);
            JobServiceRecords::where(['job_id'=>$sale->id,'item_id'=>1])->update(['is_enabled'=> 1]);
            $this->updateServiceItemPurchaseFlug($sale->id);
            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Sale approved successfully.'
            ], 200);
            
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Error approving sale.',
                'error'   => $e->getMessage(),
            ], 500);
        }
    }

    public function generateProfit($sale_id)
    {
        $sale = Sale::find($sale_id);
        $saleDetails = SaleDetails::where('sale_id', $sale_id)->get();

        $totalProfit = 0;
        $totalNetproft = 0;
        $totalPurchasePrice = 0;
        $totalSalesPrice = 0;

        foreach ($saleDetails as $key => &$sd) {
            $item = Item::findOrFail($sd->item_id);
            $item->sale_price = $sd->unit_price;
            $sd->purchase_price = $item->purchase_price;
            $sd->subtotal_profit = round(($item->sale_price - $item->purchase_price), 2);
            $totalPurchasePrice += $item->purchase_price;
            $totalSalesPrice += $item->sale_price;
        }
        
        $totalProfit = $totalSalesPrice - $totalPurchasePrice;


        foreach ($saleDetails as $key => $sd) {
            $saleDetails->purchase_price = $item->purchase_price;
            $profit_percentage_per_item = ($totalProfit != 0) ? ($sd->subtotal_profit / $totalProfit) * 100 : 0;
            $discount_of_each_item = $sale->discount * ($profit_percentage_per_item/100);
            $net_sale_price = $sd->unit_price - $discount_of_each_item;
            $net_subtotal_profit = round($sd->subtotal_profit - $discount_of_each_item, 2);
            SaleDetails::find($sd->id)->update(
                [
                    'purchase_price'=>$sd->purchase_price,
                    'profit'=>$sd->subtotal_profit,
                    'net_sale_price'=>$net_sale_price,
                    'net_profit'=>$net_subtotal_profit,
                ]
            );
        }
    }
    public function updateServiceItemPurchaseFlug($sale_id)
    {
        // Start with all standalone service items
        $service_item_ids = Item::where(['item_type' => 0, 'is_saleable' => 0])->pluck('id')->toArray();
    
        $saleDetails = SaleDetails::where('sale_id', $sale_id)->get();
    
        foreach ($saleDetails as $sd) {
            $item = Item::findOrFail($sd->item_id);
    
            if ($item->item_type == 0) {
                // Already included in initial list, but just in case
                if (!in_array($item->id, $service_item_ids)) {
                    $service_item_ids[] = $item->id;
                }
            } elseif ($item->item_type == 1) {
                // For packages, fetch all items in the package
                $package_item_ids = Item::where('package_id', $item->id)->pluck('package_item_id')->toArray();
    
                foreach ($package_item_ids as $pid) {
                    if (!in_array($pid, $service_item_ids)) {
                        $service_item_ids[] = $pid;
                    }
                }
            }
        }
    
        // Update job service records where items match and not purchased yet
        JobServiceRecords::where([
            'job_id' => $sale_id,
            'is_agent_purchased' => 0
        ])->whereIn('item_id', $service_item_ids)
          ->update(['is_agent_purchased' => 1]);
    }
    
    
    public function destroy($id)
    {
        Sale::destroy($id);
        SaleDetails::where('sale_id',$id)->delete();
        return response()->json(['success'=>true,'message'=>'Data Deleted Successfully!'], 200);
    }

    public function list(Request $request)
    {
        $status_filter_type = $request->input('status_filter_type');
        $status_filter_value = $request->input('status_filter_value');
        $select = 
        [
            'sales.id',
            'customers.name as customer_name',
            'customers.code as customer_code',
            'admins.name as creator_name',
            'countries.country_code',
            'medical_centers.name as medical_name',
            'sales.customer_id',
            'sales.passenger_name',
            'sales.passenger_passport_no',
            'sales.passport_img',
            'sales.localhost_no',
            'sales.invoice_no',
            'sales.date',
            'sales.total_price',
            'sales.discount',
            'sales.vat_tax',
            'sales.total_payable',
            'sales.paid_amount',
            'sales.note',
            'sales.payment_status',
            'sales.status',
        ];

        $query = Sale::with(['serviceshorts'])
                    ->leftjoin('medical_centers', 'medical_centers.id', '=', 'sales.medical_id')
                    ->leftJoin('countries', 'countries.id', '=', 'sales.country_id')
                    ->join('customers', 'customers.id', '=', 'sales.customer_id')
                    ->join('admins', 'admins.id', '=', 'sales.created_by_id');


        if($request->has('customer_id') && $request->customer_id != 0){
            $query = $query->where('customer_id', $request->customer_id);
        }

        if($status_filter_type == 'job_status'){
            $query = $query->where('sales.status', $status_filter_value);
        }

        if ($request->remaining_days !== null || $status_filter_type == 'service_status') {
            $days = (int) $request->remaining_days;
            $query = $query->whereHas('serviceshorts', function ($sq) use ($days, $status_filter_type, $status_filter_value, $request) {
                $sq->where('is_complete', 0);
                if ($request->remaining_days !== null) {
                    $sq->whereNotNull('expire_date');
                    if ($days >= 0) {
                        $sq->whereRaw('DATEDIFF(expire_date, CURDATE()) BETWEEN 0 AND ?', [$days]);
                    } else {
                        $sq->whereRaw('DATEDIFF(expire_date, CURDATE()) < 0');
                    }
                }

                if ($status_filter_type == 'service_status') {
                    $sq->where('status_id', $status_filter_value);
                }
            });
        }


        if(!$request->has('order') && $request->remaining_days==null) $query = $query->orderBy('sales.id','desc')->orderBy('sales.status','asc');
        
        $query = $query->select($select);
        return DataTables::of($query)
                ->filter(function ($query) use ($request) {
                    if ($search = $request->input('search.value')) {
                        $query->where(function ($q) use ($search) {
                            $q->where('customers.name', 'like', "%{$search}%")
                            ->orWhere('customers.phone', 'like', "%{$search}%")
                            ->orWhere('sales.passenger_name', 'like', "%{$search}%")
                            ->orWhere('sales.passenger_passport_no', 'like', "%{$search}%")
                            ->orWhere('sales.localhost_no', 'like', "%{$search}%")
                            ->orWhere('sales.invoice_no', 'like', "%{$search}%")
                            ->orWhere('sales.date', 'like', "%{$search}%")
                            ->orWhere('sales.note', 'like', "%{$search}%");
                            $statusMap = [
                                'paid'    => 1,
                                'unpaid'  => 0,
                                'partial' => -1,
                            ];
                            $searchLower = strtolower($search);
                            if (array_key_exists($searchLower, $statusMap)) {
                                $search = $statusMap[$searchLower];
                                $q->orWhere('sales.payment_status', $search);
                            }
                            $statusMap = [
                                'pending'   => 0,
                                'proccessing'=> 1,
                                'complete'  => 2,
                                'cancelled' => 3,
                                'refunded'  => 4,
                            ];
                            $searchLower = strtolower($search);
                            if (array_key_exists($searchLower, $statusMap)) {
                                $searchValue = $statusMap[$searchLower];
                                $q->orWhere('sales.status', $searchValue);
                            }
                        });
                    }
                })->make(true);
    }

    
    
}