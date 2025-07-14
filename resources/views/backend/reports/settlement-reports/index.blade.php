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
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="row d-flex justify-content-center">
                                            <div class="col-6">
                                                <div class="form-group d-flex align-items-center">
                                                    <label for="date-range" class="mr-2 mb-0"
                                                        style="white-space: nowrap;">Filter:</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="far fa-calendar-alt"></i>
                                                            </span>
                                                        </div>
                                                        <input type="text" value="" class="form-control float-right"
                                                            id="date-range">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="bootstrap-data-table-panel">
                                            <div class="table-responsive">
                                                <table id="dataTable"
                                                    class="table table-sm table-striped table-bordered table-centre text-center">
                                                    <thead>
                                                        <tr>
                                                            <th>SN</th>
                                                            <th>Agent Name</th>
                                                            <th>Passport No</th>
                                                            <th>Local Host</th>
                                                            <th>Local Host Bar</th>
                                                            <th>Amount</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
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

        $('#date-range').daterangepicker();
        $('#date-range').val("");

        loadAssetData();
        $(document).on('change', '#date-range', function () {
        if (!$.fn.DataTable.isDataTable('#dataTable')) {
            loadAssetData();
        } else {
            $('#dataTable').DataTable().draw();
        }
    });
    });
    function loadAssetData() {
        var table = $('#dataTable').DataTable({
        processing: false,
        serverSide: true,
        ajax: {
            url: '{{ route("reports.settlement") }}',
            type: 'post',
            data: function(d) {
                d.daterange = $('#date-range').val().replace(/\//g, '_').replace(/ /g, '');
                d._token = $('meta[name="csrf-token"]').attr('content');
            },
        },
        columns: [

                    { data: null, orderable: false, searchable: false },
                    { data: 'agent_name', name: 'customers.agent_name'},
                    {
                        data: 'passenger_passport_no', 
                        name: 'sales.passenger_passport_no', 
                        orderable: true, 
                        searchable: true, 
                        render: function(data, type, row, meta) {
                            return row.passenger_passport_no.toUpperCase();
                        }
                    },
                    {
                        data: 'localhost_no', 
                        name: 'sales.localhost_no', 
                        orderable: true, 
                        searchable: true, 
                        render: function(data, type, row, meta) {
                            return row.localhost_no.toUpperCase();
                        }
                    },
                    { data: 'localhost_no', name: 'sales.localhost_no'},
                    {
                        data: null, 
                        name: null, 
                        orderable: false, 
                        searchable: false, 
                        render: function(data, type, row, meta) {
                            return '';
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
        let daterange = $('#date-range').val().replace(/\//g, '_').replace(/ /g, '');
        window.open(`?&print=true&daterange=${daterange}`, '_blank');
    }
</script>
@endsection
