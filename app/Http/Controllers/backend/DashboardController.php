<?php

namespace App\Http\Controllers\backend;

use App\Models\BasicInfo;
use App\Models\BikePurchase;
use App\Models\Sale;
use App\Models\JobServiceRecords;
use App\Models\InvestorTransaction;
use App\Models\Agent;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Auth;

class DashboardController extends Controller
{
    protected $breadcrumb;

    public function __construct()
    {
        $this->breadcrumb = ['title' => 'Dashboard'];
    }

    public function index()
    {
        $agent_id = Auth::guard('admin')->user()->agent_id;
        $data['breadcrumb'] = $this->breadcrumb;

        $data['basicInfo'] = BasicInfo::first()->toArray();

        $data['total_pending_job'] = Sale::where('status', 0)
            ->when($agent_id, fn($q) => $q->where('customer_id', $agent_id))
            ->count();
        $data['total_processing_job'] = Sale::where('status', 1)
            ->when($agent_id, fn($q) => $q->where('customer_id', $agent_id))
            ->count();
        $data['total_completed_job'] = Sale::where('status', 2)
            ->when($agent_id, fn($q) => $q->where('customer_id', $agent_id))
            ->count();
        $data['total_refunded_job'] = Sale::where('status', 3)
            ->when($agent_id, fn($q) => $q->where('customer_id', $agent_id))
            ->count();
        $data['total_cancelled_job'] = Sale::where('status', 4)
            ->when($agent_id, fn($q) => $q->where('customer_id', $agent_id))
            ->count();

        $data['request_for_settlement'] = JobServiceRecords::join('sales', 'sales.id', '=', 'job_service_records.job_id')
                ->where(['status_id'=>8, 'sales.status'=> 1])
                ->when($agent_id, fn($q) => $q->where('sales.customer_id', $agent_id))
                ->count();
        $data['request_for_slip'] = JobServiceRecords::join('sales', 'sales.id', '=', 'job_service_records.job_id')
                ->where(['status_id'=>12, 'sales.status'=> 1])
                ->when($agent_id, fn($q) => $q->where('sales.customer_id', $agent_id))
                ->count();
        $data['request_for_mofa'] = JobServiceRecords::join('sales', 'sales.id', '=', 'job_service_records.job_id')
                ->where(['status_id'=>18, 'sales.status'=> 1])
                ->when($agent_id, fn($q) => $q->where('sales.customer_id', $agent_id))
                ->count();
        $data['request_for_fitcard'] = JobServiceRecords::join('sales', 'sales.id', '=', 'job_service_records.job_id')
                ->where(['status_id'=>23, 'sales.status'=> 1])
                ->when($agent_id, fn($q) => $q->where('sales.customer_id', $agent_id))
                ->count();


      


        // $data['total_pending_job'] = Job::where('status', 1)
        //                         ->count();
        
        // $data['investor_bike'] = BikePurchase::where('purchase_status', 1)
        //                         ->where('selling_status', 0)
        //                         ->where('investor_id', '!=', 1)
        //                         ->count();
        
        // $data['my_bike'] = BikePurchase::where('purchase_status', 1)
        //                         ->where('selling_status', 0)
        //                         ->where('investor_id', Auth::guard('admin')->user()->investor_id)
        //                         ->count();
        
        // $data['total_sold'] = BikePurchase::where('selling_status', 1)->count();
        
        // $data['todayssales'] = BikePurchase::where('selling_status', 1)
        //                         ->join('bike_sales', 'bike_sales.bike_purchase_id', '=', 'bike_purchases.id')
        //                         ->where('bike_sales.sale_date', date('Y-m-d'))
        //                         ->count();
        
        // $data['todayspurchase'] = BikePurchase::where('purchase_status', 1)
        //                         ->where('selling_status', 0)
        //                         ->where('purchase_date', date('Y-m-d'))
        //                         ->count();

        // $data['todaysexpenses'] = Expense::where('status', 1)
        //                         ->where('date', date('Y-m-d'))
        //                         ->sum('total_amount');
        // $data['accessories'] = Sale::join('sale_details', 'sale_details.sale_id', '=', 'sales.id')
        //                         ->join('items', 'items.id', '=', 'sale_details.item_id')
        //                         ->where('sales.status', 1)
        //                         ->where('items.cat_type_id', 1)
        //                         ->whereDate('sales.date', date('Y-m-d'))
        //                         ->select(DB::raw('SUM(sale_details.quantity * sale_details.unit_price) as total'))
        //                         ->value('total');
        // $data['spareparts'] = Sale::join('sale_details', 'sale_details.sale_id', '=', 'sales.id')
        //                         ->join('items', 'items.id', '=', 'sale_details.item_id')
        //                         ->where('sales.status', 1)
        //                         ->where('items.cat_type_id', 2)
        //                         ->whereDate('sales.date', date('Y-m-d'))
        //                         ->select(DB::raw('SUM(sale_details.quantity * sale_details.unit_price) as total'))
        //                         ->value('total');
        // $data['services'] = Sale::join('sale_details', 'sale_details.sale_id', '=', 'sales.id')
        //                         ->where('sales.status', 1)
        //                         ->where('sale_details.item_type', 1)
        //                         ->whereDate('sales.date', date('Y-m-d'))
        //                         ->select(DB::raw('SUM(sale_details.quantity * sale_details.unit_price) as total'))
        //                         ->value('total');
        // $data['investorProfitPayment'] = BikeProfitShareRecords::where('status', 1)
        //                         ->whereDate('date', date('Y-m-d'))
        //                         ->sum('amount');
        // $data['newinvestments'] = InvestorTransaction::where('status', 1)
        //                         ->whereDate('transaction_date', date('Y-m-d'))
        //                         ->sum('credit_amount');
        // $data['investmentwithdrawal'] = InvestorTransaction::where('status', 1)
        //                         ->whereDate('transaction_date', date('Y-m-d'))
        //                         ->sum('debit_amount');
        // $data['investorbalance'] = Agent::where(['is_self'=>0, 'status'=> 1])
        //                             ->sum('balance');
        // $data['mybalance'] = Agent::find(Auth::guard('admin')->user()->agent_id)
        //                         ->value('balance');
        return view('backend.index', compact('data'));
        
    }

    
    public function bikeList(Request $request)
    {
        $select = [
            'bike_purchases.id',
            'investors.name as investor_name',
            'bike_models.name as model_name',
            'colors.name as color_name',
            'colors.hex_code',
            'sellers.name as seller_name',
            'bikes.registration_no',
            'bikes.chassis_no',
            'bike_purchases.seller_id',
            'bike_purchases.purchase_price',
            'bike_purchases.servicing_cost',
            'bike_purchases.total_cost',
            'bike_purchases.purchase_date',
        ];
    
        // Default selling status: unsold
        $selling_status = 0;
    
        // Get the logged-in investor ID (if available)
        $investor_id = Auth::guard('admin')->user()->investor_id ?? null;
    
        // Base query with joins
        $query = BikePurchase::join('investors', 'investors.id', '=', 'bike_purchases.investor_id')
            ->join('bikes', 'bikes.id', '=', 'bike_purchases.bike_id')
            ->join('bike_models', 'bike_models.id', '=', 'bikes.model_id')
            ->join('colors', 'colors.id', '=', 'bikes.color_id')
            ->join('accounts', 'accounts.id', '=', 'bike_purchases.account_id')
            ->join('payment_methods', 'payment_methods.id', '=', 'accounts.payment_method_id')
            ->join('sellers', 'sellers.id', '=', 'bike_purchases.seller_id')
            ->leftJoin('bike_sales', 'bike_sales.bike_purchase_id', '=', 'bike_purchases.id');
    
        // Apply filters
        switch ($request->filteron) {
            case 'bikestock':
                    $query->where(['bike_purchases.selling_status'  => 0]);
                break;
            case 'mybikes':
                if ($investor_id) {
                    $query->where('bike_purchases.investor_id', $investor_id)->where(['bike_purchases.selling_status'  => 0]);
                }
                break;
    
            case 'investorbikes':
                if ($investor_id) {
                    $query->where('bike_purchases.investor_id', '!=', $investor_id)->where(['bike_purchases.selling_status'  => 0]);
                }
                break;
    
            case 'soldbikes':
                $query->where(['bike_purchases.selling_status'  => 1]);
                break;
    
            case 'todayspurchases':
                $query->whereDate('bike_purchases.purchase_date', Carbon::today());
                break;
            case 'todayssales':
                $query->whereDate('bike_sales.sale_date', Carbon::today())->where(['bike_purchases.selling_status'  => 1]);
                break;
        }
    
        // Apply common filters
        $query->where([
            'bike_purchases.purchase_status' => 1,
        ]);
    
        // Default ordering
        if (!$request->has('order')) {
            $query->orderBy('bike_purchases.id', 'desc');
        }
    
        // Select final fields
        $query->select($select);
    
        // Return result as DataTable
        return DataTables::of($query)->make(true);
    }
    

}
