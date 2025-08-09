@inject('authorization', 'App\Services\AuthorizationService')
@extends('layouts.admin.master')
@section('content')
    @php
        $menuID = [46, 47, 48, 49, 50];
    @endphp
    <style>
        table tr td:nth-child(2),
        table tr th:nth-child(2) {
            text-align: left !important;
        }

        .cursor-pointer {
            cursor: pointer;
        }

        .active-cust {
            border: 2px solid #03d6ba;
            background-color: #dcebe9;
        }

        .bikefilter {
            font-size: 16px;
        }

        .bikefilter>.info-box-content {
            padding: 0 2px;
        }

        .bikefilter>.info-box-icon {
            width: 60px !important;
        }

        .investorsfilter {
            font-size: 13px;
        }
        .investorsfilter>.info-box-content {
            padding: 0 2px;
        }
        .investorsfilter>.info-box-icon {
            width: 50px !important;
        }
    </style>
    <div class="content-wrapper">
        @include('layouts.admin.content-header')
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    @if($authorization->hasMenuAccess(182))
                        <div class="col-lg-12">
                            <h5 class="mb-2">Job Status</h5>
                            <div class="row">
                                <div class="col" {{ !$authorization->hasMenuAccess(170) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index', ['status_filter_type' => 'job_status', 'status_filter_value' => 0]) }}">
                                        <span class="info-box-icon bg-warning elevation-1">
                                            <i class="fas fa-tasks"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Pending Job</span>
                                            <span class="info-box-number">
                                                {{ $data['total_pending_job'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(171) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index', ['status_filter_type' => 'job_status', 'status_filter_value' => 1]) }}">
                                        <span class="info-box-icon bg-primary elevation-1">
                                            <i class="fas fa-tasks"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Processing Job</span>
                                            <span class="info-box-number">
                                                {{ $data['total_processing_job'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(172) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index', ['status_filter_type' => 'job_status', 'status_filter_value' => 3]) }}">
                                        <span class="info-box-icon bg-dark elevation-1">
                                            <i class="fas fa-tasks"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Refunded Job</span>
                                            <span class="info-box-number">
                                                {{ $data['total_refunded_job'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(178) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index', ['status_filter_type' => 'job_status', 'status_filter_value' => 2]) }}">
                                        <span class="info-box-icon bg-success elevation-1">
                                            <i class="fas fa-tasks"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Completed Job</span>
                                            <span class="info-box-number">
                                                {{ $data['total_completed_job'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(169) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index', ['status_filter_type' => 'job_status', 'status_filter_value' => 4]) }}">
                                        <span class="info-box-icon bg-danger elevation-1">
                                            <i class="fas fa-tasks"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Cancelled Job</span>
                                            <span class="info-box-number">
                                                {{ $data['total_cancelled_job'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    @endif
                    @if($authorization->hasMenuAccess(183))
                        <div class="col-lg-12">
                            <h5 class="mb-2">All Request</h5>
                            <div class="row">
                                <div class="col" {{ !$authorization->hasMenuAccess(173) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index', ['status_filter_type' => 'service_status', 'status_filter_value' => 8]) }}">
                                        <span class="info-box-icon bg-warning elevation-1">
                                            <i class="fas fa-share-square"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Requested For Settlement</span>
                                            <span class="info-box-number">
                                                {{ $data['request_for_settlement'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(174) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index', ['status_filter_type' => 'service_status', 'status_filter_value' => 12]) }}">
                                        <span class="info-box-icon bg-warning elevation-1">
                                            <i class="fas fa-share-square"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Requested For Slip</span>
                                            <span class="info-box-number">
                                                {{ $data['request_for_slip'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(175) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index', ['status_filter_type' => 'service_status', 'status_filter_value' => 18]) }}">
                                        <span class="info-box-icon bg-warning elevation-1">
                                            <i class="fas fa-share-square"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Requested For MOFA</span>
                                            <span class="info-box-number">
                                                {{ $data['request_for_mofa'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(180) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index', ['status_filter_type' => 'service_status', 'status_filter_value' => 23]) }}">
                                        <span class="info-box-icon bg-warning elevation-1">
                                            <i class="fas fa-share-square"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Requested For Fit Card</span>
                                            <span class="info-box-number">
                                                {{ $data['request_for_fitcard'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    @endif
                    @if($authorization->hasMenuAccess(184))
                        <div class="col-lg-12">
                            <h5 class="mb-2">Others Service Status</h5>
                            <div class="row">
                                <div class="col" {{ !$authorization->hasMenuAccess(47) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron="" href="{{ route('sales.index', ['status_filter_type' => 'service_status', 'status_filter_value' => 2]) }}">
                                        <span class="info-box-icon bg-success elevation-1">
                                            <i class="fa fa-tag"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Today Medical Completed</span>
                                            <span class="info-box-number">
                                                {{ $data['today_medical_completed'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(48) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index', ['status_filter_type' => 'service_status', 'status_filter_value' => 3]) }}">
                                        <span class="info-box-icon bg-success elevation-1">
                                            <i class="fa fa-tag"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Waiting For Medical Result</span>
                                            <span class="info-box-number">
                                                {{ $data['waiting_for_medical_result'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(49) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index', ['status_filter_type' => 'service_status', 'status_filter_value' => 7]) }}">
                                        <span class="info-box-icon bg-success elevation-1">
                                            <i class="fa fa-tag"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Settlement Pending</span>
                                            <span class="info-box-number">
                                                {{ $data['pending_settlement'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(50) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index', ['status_filter_type' => 'service_status', 'status_filter_value' => 16]) }}">
                                        <span class="info-box-icon bg-success elevation-1">
                                            <i class="fa fa-tag"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Online Fit On Wafid</span>
                                            <span class="info-box-number">
                                                {{ $data['online_on_wafid'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(168) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index', ['status_filter_type' => 'service_status', 'status_filter_value' => 25]) }}">
                                        <span class="info-box-icon bg-success elevation-1">
                                            <i class="fa fa-tag"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">FIT Card Ready</span>
                                            <span class="info-box-number">
                                                {{ $data['fit_card_ready'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(46) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index', ['status_filter_type' => 'service_status', 'status_filter_value' => 26]) }}">
                                        <span class="info-box-icon bg-success elevation-1">
                                            <i class="fa fa-tag"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">FIT Card Delivery Done</span>
                                            <span class="info-box-number">
                                                {{ $data['fit_card_delivery_done'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    @endif
            </div>
        </section>
    </div>
@endsection