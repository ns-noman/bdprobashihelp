@extends('layouts.admin.master')
@section('content')
    <div class="content-wrapper">
        @include('layouts.admin.content-header')
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <section class="col-lg-12">
                        <div class="card">
                            <div class="card-header bg-info p-1 d-flex justify-content-end justify-align-center">
                                <h3 class="card-title">
                                    <a href="javascript:void(0)"class="btn btn-dark shadow rounded" onclick="print()"><i
                                            class="fas fa-print"></i>
                                        <span>Print</span></i></a>
                                </h3>
                            </div>
                            <div class="card-body">
                                <div class="bootstrap-data-table-panel">
                                    <div class="table-responsive">
                                        <table id="dataTable" class="table table-sm table-striped table-bordered table-centre">
                                            <thead>
                                                <tr>
                                                    <th>SN</th>
                                                    <th>Bike Model</th>
                                                    <th>Purchase Price (BDT)</th>
                                                    <th>Repair Cost (BDT)</th>
                                                    <th>Total Cost (BDT)</th>
                                                    <th>Selling Price(BDT)</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>SN</th>
                                                    <th>Bike Model</th>
                                                    <th>Purchase Price (BDT)</th>
                                                    <th>Repair Cost (BDT)</th>
                                                    <th>Total Cost (BDT)</th>
                                                    <th>Selling Price(BDT)</th>
                                                    <th>Status</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </div>
@endsection
@section('script')
<script>
    $(document).ready(function(){
        loadAssetData();
    });
    function loadAssetData() {
        var table = $('#dataTable').DataTable({initComplete: function () {
            const filterContainer = $('.dataTables_filter').parent();
            const colmd = 4;
            $('#dataTable_length').parent().removeClass('col-md-6').addClass(`col-md-${colmd}`);
            $('#dataTable_filter').parent().removeClass('col-md-6').addClass(`col-md-${colmd}`);
            filterContainer.before(`
                <div class="col-sm-12 col-md-${colmd}">
                    <div id="dataTable_filter" class="dataTables_filter" style="text-align: center;">
                        <label>
                            Date: <input id="date" value="{{ date('Y-m') }}" type="month" class="form-control form-control-sm filter">
                        </label>
                    </div>
                </div>
            `);
        },
        processing: false,
        serverSide: true,
        ajax: {
            url: '{{ route("reports.bike-inventory") }}',
            type: 'post',
            data: function(d) {
                d.date = $('#date').val() || "{{ date('Y-m') }}";
                d._token = $('meta[name="csrf-token"]').attr('content');
            }
        },
        columns: [
                    { data: null, orderable: false, searchable: false },
                    { data: 'model_name', name: 'bike_models.name'},
                    { data: 'purchase_price', name: 'bike_purchases.purchase_price'},
                    { data: 'servicing_cost', name: 'bike_purchases.servicing_cost'},
                    { data: 'total_cost', name: 'bike_purchases.total_cost'},
                    { data: 'sale_price', name: 'bike_sales.sale_price'},
                    {
                        data: null, 
                        name: 'bike_purchases.selling_status', 
                        orderable: true, 
                        searchable: false, 
                        render: function(data, type, row, meta) {
                            return `${(row.selling_status == '0') ? 'Available' : 'Sold'}`;
                        }
                    },
                ],
            rowCallback: function(row, data, index) {
                var pageInfo = table.page.info();
                var serialNumber = pageInfo.start + index + 1;
                $('td:eq(0)', row).html(serialNumber);
            },
            order: [],
            search: {return: false}
        });
        $(document).on('change','.filter',function() {
            table.draw();
        });
    }
    function print() {
        let date = $('#date').val() || '';
        window.open(`?&print=true&date=${date}`, '_blank');
    }
</script>
@endsection