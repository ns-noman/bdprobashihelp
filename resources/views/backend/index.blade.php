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
                                        <span class="info-box-icon bg-success elevation-1">
                                            <i class="fa fa-shopping-cart"></i>
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
                                            <i class="fa fa-tools"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Procesing Job</span>
                                            <span class="info-box-number">
                                                {{ $data['total_processing_job'] }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(172) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index', ['status_filter_type' => 'job_status', 'status_filter_value' => 3]) }}">
                                        <span class="info-box-icon bg-warning elevation-1">
                                            <i class="fa fa-cogs"></i>
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
                                        <span class="info-box-icon bg-warning elevation-1">
                                            <i class="fa fa-cogs"></i>
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
                                        <span class="info-box-icon bg-warning elevation-1">
                                            <i class="fa fa-cogs"></i>
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
                                        <span class="info-box-icon bg-success elevation-1">
                                            <i class="fa fa-shopping-cart"></i>
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
                                        <span class="info-box-icon bg-primary elevation-1">
                                            <i class="fa fa-tools"></i>
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
                                            <i class="fa fa-cogs"></i>
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
                                            <i class="fa fa-cogs"></i>
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
            </div>
        </section>
    </div>
@endsection
@section('script')
    <script>
        let isAssetTableInitialized = false;
        $(document).ready(function() {
            loadBikeTableData();
        });

        function loadBikeTableData() {
            loadBikeTable();
            var table = $('#dataTable').DataTable({
                processing: false,
                serverSide: true,
                ajax: {
                    url: '{{ route('dashboard.bike-list') }}',
                    type: 'GET',
                    data: function(d) {
                        let activeElement = $('.bikefilter.active-cust');
                        let filteron = 'mybikes';
                        if (activeElement.length > 0) filteron = activeElement.data('filteron');
                        d.filteron = filteron;
                    },
                },
                columns: [{
                        data: null,
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: null,
                        name: 'bike_models.name',
                        orderable: true,
                        searchable: false,
                        render: function(data, type, row, meta) {
                            return `${row.model_name} <span class="badge" style="background-color: ${row.hex_code};color: black; text-shadow: 2px 0px 8px white;">${row.color_name}</span><br>Ch#${row.chassis_no}<br>Reg#${row.registration_no}`;
                        }
                    },
                    {
                        data: 'purchase_date',
                        name: 'bike_purchases.purchase_date'
                    },
                    {
                        data: 'seller_name',
                        name: 'sellers.name'
                    },
                    {
                        data: 'purchase_price',
                        name: 'bike_purchases.purchase_price'
                    },
                    {
                        data: 'servicing_cost',
                        name: 'bike_purchases.servicing_cost'
                    },
                    {
                        data: 'total_cost',
                        name: 'bike_purchases.total_cost'
                    },
                ],
                rowCallback: function(row, data, index) {
                    var pageInfo = table.page.info();
                    var serialNumber = pageInfo.start + index + 1;
                    $('td:eq(0)', row).html(serialNumber);
                },
                order: [],
                search: {
                    return: false
                }
            });
            $(document).on('click', '.bikefilter', function() {
                table.draw();
            });
            // $('.bikefilter.drawable').on('click', function () {
            //     table.draw();
            //     al
            // });
        }

        function loadBikeTable() {
            const table = (`
            <table id="dataTable" class="table table-sm table-striped table-bordered table-centre text-center">
                <thead>
                    <tr>
                        <th>SN</th>
                        <th>Bike Info</th>
                        <th>Purchase Date</th>
                        <th>Seller</th>
                        <th>Purchase Price</th>
                        <th>Service Cost</th>
                        <th>Net Cost</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        `);
            $('#table-holder').html(table);
        }
        $('.activeable').on('click', function() {
            $('.activeable').removeClass('active-cust');
            $(this).toggleClass('active-cust');
        });
    </script>
@endsection
