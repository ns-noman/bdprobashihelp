@extends('layouts.admin.master')
@section('content')
@php
    $roleType = Auth::guard('admin')->user()->type;
    $customer_id = Auth::guard('admin')->user()->agent_id;
@endphp
    <style>
        .custom-disabled {
            cursor: not-allowed!important;
            pointer-events: none!important;
        }
    </style>
    <div class="content-wrapper">
        @include('layouts.admin.content-header')
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <section class="col-lg-12">
                        <div class="card">
                            <div class="card-header bg-primary p-1">
                                <h3 class="card-title">
                                </h3>
                            </div>
                            <div class="card-body">
                                <div class="bootstrap-data-table-panel">
                                    <div class="table-responsive">
                                        <table id="dataTable" class="table table-sm table-striped table-bordered table-centre text-center">
                                            <thead>
                                                <tr>
                                                    <th>Action</th>
                                                    <th>Status</th>
                                                    <th>PaymentStatus</th>
                                                    <th style="min-width: 1000px;text-align: center;">Service Availed</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
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
            $(document).on('click','.pay-now', function(e) {
                $('#sale_id').val($(this).attr('sale-id'));
                $('#amount').val(parseFloat($(this).attr('due')).toFixed(2));
                $('#due_amount').val(parseFloat($(this).attr('due')).toFixed(2));
            });
            $('#form-submit').submit(function(e) {
                let paid_amount = parseFloat($('#amount').val());
                let due = parseFloat($('#due_amount').val());
                if(paid_amount>due){
                    e.preventDefault();
                    Swal.fire("Couldn't be pay more then payable!");
                }
            });
            var table = $('#dataTable').DataTable({initComplete: function () {
                const filterContainer = $('.dataTables_filter').parent();
                let rollType = "{{ $roleType }}";
                let colmd = rollType != 1 ? 6 : 4;
                filterContainer.before(`
                    <div class="col-sm-12 col-md-${colmd}"${rollType !=1 ? 'hidden' : null}>
                        <div class="dataTables_filter" style="display: flex; align-items: center; justify-content: center;">
                            <label style="font-weight: normal; white-space: nowrap; display: flex; align-items: center;margin-bottom: .5rem;">
                                Agents:
                                <select data-column="1" class="form-control form-control-sm filter select2" id="customer_id" name="customer_id" style="margin-left: 10px;">
                                    <option value="0">All Agents</option>
                                    @foreach ($data['customers'] as $customers)
                                        <option @selected(Auth::guard('admin')->user()->agent_id == $customers['id']) value="{{ $customers['id'] }}">{{ $customers['name'] }}</option>
                                    @endforeach
                                </select>
                            </label>
                        </div>
                    </div>
                `);
                $('#dataTable_length').parent().removeClass('col-md-6').addClass(`col-md-${colmd}`);
                $('#dataTable_filter').parent().removeClass('col-md-6').addClass(`col-md-${colmd}`);
            },
            processing: true,
            serverSide: true,
            ajax: {
                url: '{{ route("my-jobs.list") }}',
                type: 'GET',
                data: function(d) {
                    let rollType = "{{ $roleType }}";
                    const customer_id = $('#customer_id').val();
                    d.customer_id = customer_id || (rollType ==2 ? "{{ $customer_id }}" : 0);
                    d._token = $('meta[name="csrf-token"]').attr('content');
                },
                dataSrc: function(json)
                {
                    return json.data;
                }
            },
            columns: [
                        { 
                            data: null,
                            orderable: false, 
                            searchable: false, 
                            render: function(data, type, row, meta) {
                                let print = `{{ route('my-jobs.invoice.print', [":id", "print"]) }}`.replace(':id', row.id);
                                let view = `{{ route('my-jobs.invoice', [":id"]) }}`.replace(':id', row.id);
                                return (` <div>
                                               
                                                <a href="${view}" class="btn btn-sm btn-warning">
                                                    <i class="fa-solid fa-eye"></i>
                                                </a>
                                                <br>
                                                <a href="${print}" class="btn btn-sm btn-dark">
                                                    <i class="fa-solid fa-print"></i>
                                                </a>
                                                <br>
                                                <br>
                                            </div>
                                        `);
                            }
                        },
                        {
                            data: null, 
                            name: 'sales.status', 
                            orderable: true, 
                            searchable: false, 
                            render: function(data, type, row, meta) {
                                let color;
                                let text;
                                if(row.status == '0'){
                                    color = 'danger';
                                    text = 'Pending';
                                    eventClass = 'event';
                                }else if(row.status == '1'){
                                    color = 'primary';
                                    text = 'Approved';
                                }else if(row.status == '2'){
                                    color = 'success';
                                    text = 'Completed';
                                }else if(row.status == '3'){
                                    color = 'dark';
                                    text = 'Refunded';
                                }else if(row.status == '4'){
                                    color = 'secondary';
                                    text = 'Cancelled';
                                }
                                return `<button type="button" class="btn btn-sm btn-${color}">${text}</button>`;
                            }
                        },
                        {
                            data: null, 
                            name: 'sales.payment_status', 
                            orderable: true, 
                            searchable: false, 
                            render: function(data, type, row, meta) {
                                let color;
                                let text;
                                if(row.payment_status == '0'){
                                    color = 'warning';
                                    text = 'Unpaid';
                                }else if(row.payment_status == '1'){
                                    color = 'info';
                                    text = 'Paid';
                                }
                                return `<span class="badge badge-${color}">${text}</span>`;
                            }
                        },
                       
                        {
                            data: null, 
                            name: '', 
                            orderable: false, 
                            searchable: false, 
                            render: function(data, type, row, meta) {
                                let tr = ``;
                                let ServiceColor = '';
                                let serviceUrl = 'javascript:void(0)';
                                let text;
                                let eventClass = '';
                                let disabled = '';
                                let table = `<h6>Pending</h6>`;
                                if (row.serviceshorts.length) {
                                    row.serviceshorts.forEach(job_service_record => {
                                        let medicalCenterTxt = '';
                                        if(job_service_record.medical_centers !=null){
                                            let centersArray = job_service_record.medical_centers.split('|');
                                            centersArray.forEach((center, index)=>{
                                                medicalCenterTxt += center.split(':')[2] + ((index+1)<centersArray.length ? ', ' : '') ;
                                            });
                                        }

                                        statusTxt = job_service_record.servicestatus.name;
                                        statusColor = job_service_record.servicestatus.color_code;
                                        serviceUrl = `{{ route('my-jobs.service-edit', [":saleId", ":serviceRId"]) }}`.replace(':saleId', row.id).replace(':serviceRId', job_service_record.id);
                                        
                                        if(job_service_record.is_agent_purchased == '1'){
                                            ServiceColor = 'info';
                                        }else{
                                            ServiceColor = 'danger';
                                        }
                                        tr+=`<tr>
                                                <td class="p-0" style="vertical-align: middle;width: auto;">
                                                    <a ${disabled} style="width: 100%;" href="${serviceUrl}" class="${btnControl({is_enabled : job_service_record.is_enabled, status_id: job_service_record.status_id})} btn btn-sm btn-${ServiceColor} m-0" aria-disabled="true">${job_service_record.items.name}</a>
                                                </td>
                                                <td class="p-0" style="vertical-align: middle;width: auto;text-align: center;">
                                                    <span style="background-color:${statusColor};color:white;width: 100%;" class="badge badge-lg">${statusTxt}</span>
                                                </td>
                                                <td style="vertical-align: middle;width: auto;">${job_service_record.entry_date ?? ''}</td>
                                                <td style="vertical-align: middle;width: auto;">${job_service_record.expire_date ?? ''}</td>
                                                <td style="vertical-align: middle;width: auto;">${(job_service_record.expire_date  !=null) ? getDateDifferenceInDays(new Date(), job_service_record.expire_date) : ''}</td>
                                                <td style="vertical-align: middle;width: auto;word-break: normal; white-space: normal;">${medicalCenterTxt}</td>
                                                <td style="vertical-align: middle;width: auto;word-break: normal; white-space: normal;">${job_service_record.slip_no || job_service_record.mofa_no || ''}</td>
                                                <td style="vertical-align: middle;width: auto;word-break: normal; white-space: normal;">${job_service_record.remarks ?? ''}</td>
                                            </tr>`;
                                    });
                                        table = `
                                            <table class="table table-sm table-striped table-info table-center rounded m-0">
                                                <thead>
                                                    <tr class="bg-info">
                                                        <th class="text-center" style="width: 100px;" colspan="2"><span style="color: black;">Job No: </span><br><a href="${`{{ route('my-jobs.invoice', ":id") }}`.replace(':id', row.id)}" style="text-decoration: none; color: inherit;"><b>#${row.invoice_no}</b></a></th>
                                                        <th class="text-center" style="width: 200px;" colspan="2"><span style="color: black;">Agent Name: </span><br>${row.customer_name}</th>
                                                        <th class="text-center" style="width: 150px;" colspan="2"><span style="color: black;">Passenger Name: </span><br>${row.passenger_name}</th>
                                                        <th class="text-center" style="width: 150px;" colspan="1"><span style="color: black;">Passport No: </span><br>${row.passenger_passport_no}</th>
                                                        <th class="text-center" style="width: 150px;" colspan="1"><span style="color: black;">Localhost No: </span><br>${row.localhost_no}</th>
                                                    </tr>
                                                    <tr class="bg-light">
                                                        <th class="text-center" colspan="2">Date: ${row.date}</th>
                                                        <th class="text-center" colspan="3"><div class="text-center">Paid: <span class="text-success fw-bold"><b>${row.paid_amount}</b></span> | Due: <span class="text-danger fw-bold"><b>${row.total_payable - row.paid_amount}</b></span></div></th>
                                                        <th class="text-center" colspan="3">Note: ${row.note ?? ''}</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="text-center" style="width: 100px;">ServiceName</th>
                                                        <th class="text-center" style="width: 150px;">Status</th>
                                                        <th class="text-center" style="width: 80px;">EntryDate</th>
                                                        <th class="text-center" style="width: 80px;">ExpireDate</th>
                                                        <th class="text-center" style="width: 30px;">R.Day</th>
                                                        <th class="text-center" style="width: 150px;">Centers</th>
                                                        <th class="text-center" style="width: 150px;">Slip/MOFA_No</th>
                                                        <th class="text-center" style="width: 300px;">Results/Remarks</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    ${tr}
                                                </tbody>
                                            </table>
                                        `;
                                }
                                return table;
                            }
                        },
                    ],
                order: [],
                search: {return: false}
            });
            $(document).on('change','.filter',function() {
                table.draw();
            });

       
        });
        function getDateDifferenceInDays(start_date, end_date) {
            const d1 = new Date(start_date);
            const d2 = new Date(end_date);
            d1.setHours(0, 0, 0, 0);
            d2.setHours(0, 0, 0, 0);
            const diffInMs = d2 - d1;
            const diffInDays = Math.round(diffInMs / (1000 * 60 * 60 * 24));
            return diffInDays;
        }
        function btnControl(input){
            let status_id = [7,11,17,22];
            return !(input.is_enabled && status_id.includes(input.status_id)) ? ' disabled custom-disabled ' : ''; 
        }

    </script>
@endsection
