<?php

namespace App\Http\Controllers\backend;

use App\Models\Sale;
use App\Models\SaleDetails;
use App\Models\BasicInfo;
use App\Models\PaymentMethod;
use App\Models\CustomerPayment;
use App\Models\Customer;
use App\Models\Item;
use App\Models\BikeService;
use App\Models\CustomerLedger;
use App\Models\JobServiceRecords;
use App\Models\MedicalCenter;
use App\Models\StatusList;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;
use Auth;
use Carbon\Carbon;

class MyJobContorller extends Controller
{
    protected $breadcrumb;
    public function __construct(){$this->breadcrumb = ['title'=>'My Jobs'];}
    public function index()
    {
      
        $data['currency_symbol'] = BasicInfo::first()->currency_symbol;
        $data['paymentMethods'] = $this->paymentMethods();
        $data['breadcrumb'] = $this->breadcrumb;
        $data['customers'] = Customer::where('status',1)->orderBy('name','asc')->get();
        return view('backend.my-jobs.index', compact('data'));
    }


    public function serviceEdit($saleId, $serviceRecordId)
    {

        
        $data['title'] = 'Edit';
        $data['sale'] = Sale::find($saleId)->toArray();
        $data['jobServiceRecord'] = JobServiceRecords::join('items','items.id','job_service_records.item_id')
                                ->where('job_service_records.id',$serviceRecordId)
                                ->select(['job_service_records.*','items.id as item_id','items.name as item_name'])
                                ->first()->toArray();
        $data['customer_name'] = Customer::find($data['sale']['customer_id'])->name;
        $data['statusList'] = StatusList::where('item_id',$data['jobServiceRecord']['item_id'])->whereNotNull('name_for_agent')->orderBy('srl', 'asc')->get()->toArray();
        $data['centers'] = MedicalCenter::where('status',1)->orderBy('name','asc')->get()->toArray();
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.my-jobs.service-info',compact('data'));
    }

    public function inovice($id, $print=null)
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
        return view('backend.my-jobs.invoice',compact('data'));
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
            return redirect()->route('my-jobs.index')->with('alert', ['messageType' => 'success', 'message' => 'Data Inserted Successfully!']);
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert', ['messageType' => 'error', 'message' => 'Something went wrong! ' . $e->getMessage()]);
        }
    }

    public function btnControl($job_service_record_id, $status)
    {
        $current_job_item = JobServiceRecords::find($job_service_record_id);
        if(in_array($status, [5,6,10,16,21,26])){
            $current_job_item->is_enabled = 0;
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
    
    


    public function list(Request $request)
    {
        // dd($request->all());

        $select = 
        [
            'sales.id',
            'customers.name as customer_name',
            'customers.phone as customer_contact',
            'admins.name as creator_name',
            'sales.customer_id',
            'sales.passenger_name',
            'sales.passenger_passport_no',
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
            'sales.created_by_id',
            'sales.updated_by_id',
        ];
        $query = Sale::with(['serviceshorts'])->join('customers', 'customers.id', '=', 'sales.customer_id')
                            ->join('admins', 'admins.id', '=', 'sales.created_by_id');
        if(!$request->has('order')){
            $query = $query->orderBy('sales.status','asc')->orderBy('sales.id','desc');
        }
        if($request->has('customer_id') && $request->customer_id != 0){
            $query = $query->where('customer_id', $request->customer_id);
        }
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
                                'approve'   => 1,
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