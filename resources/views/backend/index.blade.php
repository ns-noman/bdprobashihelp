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
                    {{-- @if($authorization->hasMenuAccess(182))
                        <div class="col-lg-12">
                            <h5 class="mb-2">Sales & Expense Info</h5>
                            <div class="row">
                                <div class="col-md-4" {{ !$authorization->hasMenuAccess(170) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index') }}">
                                        <span class="info-box-icon bg-success elevation-1">
                                            <i class="fa fa-shopping-cart"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Today's Accessories Sales</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['accessories'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-4" {{ !$authorization->hasMenuAccess(171) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index') }}">
                                        <span class="info-box-icon bg-primary elevation-1">
                                            <i class="fa fa-tools"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Today's Service Sales</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['services'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-4" {{ !$authorization->hasMenuAccess(172) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index') }}">
                                        <span class="info-box-icon bg-warning elevation-1">
                                            <i class="fa fa-cogs"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Today's Spare Parts Sales</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['spareparts'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                @php
                                    $totalItemServiceSales = $data['accessories'] + $data['services'] + $data['spareparts'];
                                @endphp
                                <div class="col-md-4" {{ !$authorization->hasMenuAccess(178) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 activeable2" data-filteron=""
                                        href="{{ route('sales.index') }}">
                                        <span class="info-box-icon bg-danger elevation-1">
                                            <i class="fa fa-credit-card"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total sales and service</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($totalItemServiceSales, 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-4" {{ !$authorization->hasMenuAccess(169) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 expenseFilter activeable2" data-filteron=""
                                        href="{{ route('expenses.index') }}">
                                        <span class="info-box-icon bg-dark elevation-1">
                                            <i class="fa fa-money-bill-wave"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Today's Expense</span>
                                            <span class="info-box-number">{{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['todaysexpenses'], 2) }}</i></span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-4" {{ !$authorization->hasMenuAccess(179) ? 'hidden' : null }}>
                                    <div class="info-box cursor-pointer mb-3 activeable2" data-filteron="">
                                        <span class="info-box-icon bg-secondary elevation-1">
                                            <i class="fa fa-wallet"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Today's Inventory Balance</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($totalItemServiceSales - $data['todaysexpenses'], 2) }}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif
                    @if($authorization->hasMenuAccess(183))
                        <div class="col-lg-12">
                            <h5 class="mb-2">Investment Info</h5>
                            <div class="row">
                                <div class="col" {{ !$authorization->hasMenuAccess(173) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""  href="{{ route('bike-profits.index') }}">
                                        <span class="info-box-icon bg-danger elevation-1">
                                            <i class="fa fa-credit-card"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Today's Investor's Profit Payment</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['investorProfitPayment'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(174) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""  href="{{ route('investor-transactions.index') }}">
                                        <span class="info-box-icon bg-info elevation-1">
                                            <i class="fa fa-piggy-bank"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Today's New Investment</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['newinvestments'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(175) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron="" href="{{ route('investor-transactions.index') }}">
                                        <span class="info-box-icon bg-secondary elevation-1">
                                            <i class="fa fa-sign-out-alt"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Today's Investment Withdraw</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['investmentwithdrawal'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(180) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron="" href="{{ route('investors.index') }}">
                                        <span class="info-box-icon bg-success elevation-1">
                                            <i class="fa fa-wallet"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Investors Balance</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['investorbalance'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(181) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron="" href="{{ route('investor-transactions.index') }}">
                                        <span class="info-box-icon bg-info elevation-1">
                                            <i class="fa fa-wallet"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">My Investment</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['mybalance'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    @endif
                    @if($authorization->hasMenuAccess(184))
                        <div class="col-lg-12">
                            <h5 class="mb-2">Bike Info</h5>
                            <div class="row">
                                <div class="col" {{ !$authorization->hasMenuAccess(46) ? 'hidden' : null }}>
                                    <div class="info-box cursor-pointer bikefilter activeable drawable"
                                        data-filteron="bikestock">
                                        <span class="info-box-icon bg-info elevation-1">
                                            <i class="fa fa-motorcycle"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Bike Stock</span>
                                            <span class="info-box-number">{{ $data['bike_stock'] }}</i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(47) ? 'hidden' : null }}>
                                    <div class="info-box cursor-pointer mb-3 bikefilter activeable drawable"
                                        data-filteron="investorbikes">
                                        <span class="info-box-icon bg-warning elevation-1">
                                            <i class="fa fa-motorcycle"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Investors Bike</span>
                                            <span class="info-box-number">{{ $data['investor_bike'] }}</i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(48) ? 'hidden' : null }}>
                                    <div class="info-box cursor-pointer mb-3 bikefilter activeable drawable active-cust"
                                        data-filteron="mybikes">
                                        <span class="info-box-icon bg-success elevation-1">
                                            <i class="fa fa-motorcycle"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">My Bikes</span>
                                            <span class="info-box-number">{{ $data['my_bike'] }}</i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(49) ? 'hidden' : null }}>
                                    <div class="info-box cursor-pointer mb-3 bikefilter activeable"
                                        data-filteron="soldbikes">
                                        <span class="info-box-icon bg-danger elevation-1">
                                            <i class="fa fa-motorcycle"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Sold</span>
                                            <span class="info-box-number">{{ $data['total_sold'] }}</i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(50) ? 'hidden' : null }}>
                                    <div class="info-box cursor-pointer mb-3 bikefilter activeable"
                                        data-filteron="todayspurchases">
                                        <span class="info-box-icon bg-primary elevation-1">
                                            <i class="fa fa-motorcycle"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Today's Purchase</span>
                                            <span class="info-box-number">{{ $data['todayspurchase'] }}</i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(168) ? 'hidden' : null }}>
                                    <div class="info-box cursor-pointer mb-3 bikefilter activeable"
                                        data-filteron="todayssales">
                                        <span class="info-box-icon bg-dark elevation-1">
                                            <i class="fa fa-motorcycle"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Today's Sale</span>
                                            <span class="info-box-number">{{ $data['todayssales'] }}</i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif --}}
                {{-- <div class="row">
                    <div class="col-12 col-sm-12 col-md-12">
                        <div class="card">
                            <div class="card-header bg-dark p-1">
                                <div class="row">
                                    <div class="col-md-2">
                                        <h1 class="card-title text-info"></h1>
                                    </div>
                                    <div class="col-md-10">
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="bootstrap-data-table-panel">
                                    <div class="table-responsive" id="table-holder">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> --}}
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
