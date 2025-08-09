<?php

namespace App\Http\Controllers\backend;

use App\Models\BasicInfo;
use App\Models\Sale;
use App\Models\JobServiceRecords;
use App\Http\Controllers\Controller;
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

        $data['today_medical_completed'] = JobServiceRecords::join('sales', 'sales.id', '=', 'job_service_records.job_id')
                ->where(['sales.status'=> 1])
                ->whereDate('job_service_records.entry_date', Carbon::today())
                ->when($agent_id, fn($q) => $q->where('sales.customer_id', $agent_id))
                ->count();

        $data['waiting_for_medical_result'] = JobServiceRecords::join('sales', 'sales.id', '=', 'job_service_records.job_id')
                ->where(['status_id'=>3, 'sales.status'=> 1])
                ->when($agent_id, fn($q) => $q->where('sales.customer_id', $agent_id))
                ->count();

        $data['pending_settlement'] = JobServiceRecords::join('sales', 'sales.id', '=', 'job_service_records.job_id')
                ->where(['job_service_records.status_id'=>7, 'sales.status'=> 1, 'job_service_records.is_enabled'=> 1])
                ->when($agent_id, fn($q) => $q->where('sales.customer_id', $agent_id))
                ->count();
        $data['online_on_wafid'] = JobServiceRecords::join('sales', 'sales.id', '=', 'job_service_records.job_id')
                ->where(['job_service_records.status_id'=>16, 'sales.status'=> 1])
                ->when($agent_id, fn($q) => $q->where('sales.customer_id', $agent_id))
                ->count();
        $data['fit_card_ready'] = JobServiceRecords::join('sales', 'sales.id', '=', 'job_service_records.job_id')
                ->where(['job_service_records.status_id'=>25, 'sales.status'=> 1])
                ->when($agent_id, fn($q) => $q->where('sales.customer_id', $agent_id))
                ->count();
        $data['fit_card_delivery_done'] = JobServiceRecords::join('sales', 'sales.id', '=', 'job_service_records.job_id')
                ->where(['job_service_records.status_id'=>26])
                ->when($agent_id, fn($q) => $q->where('sales.customer_id', $agent_id))
                ->count();
        return view('backend.index', compact('data'));
        
    }

}
