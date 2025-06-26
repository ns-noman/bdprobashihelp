<?php

namespace App\Http\Controllers\backend;

use App\Models\BasicInfo;
use App\Models\Sale;
use App\Models\JobServiceRecords;
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
        return view('backend.index', compact('data'));
        
    }

}
