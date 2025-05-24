@extends('layouts.admin.master')
@section('content')
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
                                    <a href="{{ route('sales.create') }}"class="btn btn-light shadow rounded m-0"><i
                                            class="fas fa-plus"></i>
                                        <span>Add New</span></i></a>
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
                                                    {{-- <th>Date</th>
                                                    <th>Paid|Due</th>
                                                    <th>Note</th> --}}
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
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Add Payment</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form id="form-submit" action="{{ route('sales.payment.store') }}" method="POST"
                            enctype="multipart/form-data">
                            <div class="modal-body">
                                @csrf()
                                <div class="row">
                                    <input type="hidden" name="sale_id" id="sale_id">
                                    <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                        <label>Payment Date *</label>
                                        <input value="{{ date('Y-m-d') }}" type="date" class="form-control" name="date" id="date" placeholder="0.00">
                                    </div>
                                    <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                        <label>Payment Methods *</label>
                                        <select class="form-control" name="account_id" id="account_id" required>
                                            <option selected value=''>Select Payment Methods</option>
                                            @foreach ($data['paymentMethods'] as $paymentMethod)
                                                <option account-bal="{{ $paymentMethod['balance'] }}" @selected(isset($data['item']) && $data['item']['account_id'] == $paymentMethod['id']) value="{{ $paymentMethod['id'] }}">{{ $paymentMethod['name'] .' : '. $paymentMethod['account_no'] . ' (Bal: ' . $paymentMethod['balance'] }} &#2547;)</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                        <label>Due Amount</label>
                                        <input readonly value="0.00" type="number" class="form-control" name="due_amount" id="due_amount" placeholder="0.00">
                                    </div>
                                    <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                        <label>Paid Amount</label>
                                        <input value="0.00" type="number" class="form-control" name="amount" id="amount" placeholder="0.00">
                                    </div>
                                    <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                        <label>Note</label>
                                        <input type="text" class="form-control" name="note" id="note" placeholder="Note">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button id="cancel" type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <button id="save_payment" type="submit" class="btn btn-primary">Save</button>
                            </div>
                        </form>
                    </div>
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
            var table = $('#dataTable').DataTable({
            processing: false,
            serverSide: true,
            ajax: {
                url: '{{ route("sales.list") }}',
                type: 'GET',
            },
            columns: [
                        { 
                            data: null,
                            orderable: false, 
                            searchable: false, 
                            render: function(data, type, row, meta) {
                                let addNewItem = `{{ route('sales.add-new-item', ":id") }}`.replace(':id', row.id);
                                let edit = `{{ route('sales.edit', ":id") }}`.replace(':id', row.id);
                                let print = `{{ route('sales.invoice.print', [":id", "print"]) }}`.replace(':id', row.id);
                                let view = `{{ route('sales.invoice', [":id"]) }}`.replace(':id', row.id);
                                let destroy = `{{ route('sales.destroy', ":id") }}`.replace(':id', row.id);
                                return (` <div>
                                               
                                                <a href="${view}" class="btn btn-sm btn-warning">
                                                    <i class="fa-solid fa-eye"></i>
                                                </a>
                                                <br>
                                                <a href="${print}" class="btn btn-sm btn-dark">
                                                    <i class="fa-solid fa-print"></i>
                                                </a>
                                                <br>
                                                <button due="${row.total_payable - row.paid_amount}" sale-id="${row.id }" type="button" class="btn btn-success btn-sm pay-now"
                                                            data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap" 
                                                                ${(row.total_payable - row.paid_amount)==0? 'disabled' : null}>
                                                                <i class="fa-solid fa-hand-holding-dollar"></i>
                                                </button>
                                                <br>
                                                 <a href="${addNewItem}" class="btn btn-sm btn-primary ${row.status == '2' ? "disabled" : null}">
                                                    <i class="fa-solid fa-plus"></i>
                                                </a>
                                                <br>
                                                <a href="${edit}" class="btn btn-sm btn-info ${row.status != '0' ? 'disabled' : null}">
                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                </a>
                                                <br>
                                                <form class="delete" action="${destroy}" method="post">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-sm btn-danger" ${row.status != '0' ? "disabled" : null}>
                                                        <i class="fa-solid fa-trash-can"></i>
                                                    </button>
                                                </form>
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
                                let eventClass = '';
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
                                }
                                return `<button transaction_id=${row.id} type="button" class="btn btn-sm btn-${color} ${eventClass}">${text}</button>`;
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
                                        serviceUrl = `{{ route('sales.service-edit', [":saleId", ":serviceRId"]) }}`.replace(':saleId', row.id).replace(':serviceRId', job_service_record.id);
                                        
                                        if(job_service_record.is_agent_purchased == '1'){
                                            ServiceColor = 'info';
                                        }else{
                                            ServiceColor = 'danger';
                                        }
                                        tr+=`<tr>
                                                <td class="p-0" style="vertical-align: middle;width: auto;">
                                                    <a ${disabled} style="width: 100%;" href="${serviceUrl}" class="${btnControl({is_enabled : job_service_record.is_enabled})} btn btn-sm btn-${ServiceColor} m-0" aria-disabled="true">${job_service_record.items.name}</a>
                                                </td>
                                                <td class="p-0" style="vertical-align: middle;width: auto;text-align: center;">
                                                    <span style="background-color:${statusColor};color:white;width: 100%;" class="badge badge-lg">${statusTxt}</span>
                                                </td>
                                                <td style="vertical-align: middle;width: auto;">${job_service_record.entry_date ?? ''}</td>
                                                <td style="vertical-align: middle;width: auto;">${job_service_record.expire_date ?? ''}</td>
                                                <td style="vertical-align: middle;width: auto;">${(job_service_record.expire_date  !=null) ? getDateDifferenceInDays(new Date(), job_service_record.expire_date) : ''}</td>
                                                <td style="vertical-align: middle;width: auto;word-break: normal; white-space: normal;">${medicalCenterTxt}</td>
                                                <td style="vertical-align: middle;width: auto;word-break: normal; white-space: normal;">${job_service_record.remarks ?? ''}</td>
                                            </tr>`;
                                    });
                                        table = `
                                            <table class="table table-sm table-striped table-info table-center rounded m-0">
                                                <thead>
                                                    <tr class="bg-secondary">
                                                        <th class="text-center" style="width: 100px;" colspan="2">JN: <a href="${`{{ route('sales.invoice', ":id") }}`.replace(':id', row.id)}" style="color: #09b976;"><b>#${row.invoice_no}</b></a></th>
                                                        <th class="text-center" style="width: 200px;" colspan="2">Agent: ${row.customer_name}</th>
                                                        <th class="text-center" style="width: 150px;" colspan="2">P.Name: ${row.passenger_name}</th>
                                                        <th class="text-center" style="width: 150px;" colspan="1">Pass.No: ${row.passenger_passport_no}</th>
                                                    </tr>
                                                    <tr class="bg-light">
                                                        <th class="text-center" colspan="2">Date: ${row.date}</th>
                                                        <th class="text-center" colspan="3"><div class="text-center">Paid: <span class="text-success fw-bold"><b>${row.paid_amount}</b></span> | Due: <span class="text-danger fw-bold"><b>${row.total_payable - row.paid_amount}</b></span></div></th>
                                                        <th class="text-center" colspan="2">Note: ${row.note ?? ''}</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="text-center" style="width: 100px;">ServiceName</th>
                                                        <th class="text-center" style="width: 150px;">Status</th>
                                                        <th class="text-center" style="width: 80px;">EntryDate</th>
                                                        <th class="text-center" style="width: 80px;">ExpireDate</th>
                                                        <th class="text-center" style="width: 30px;">R.Day</th>
                                                        <th class="text-center" style="width: 150px;">Centers</th>
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

            $(document).on('click', '.delete button', function(e) {
                e.preventDefault();
                let form = $(this).closest('form');
                let tr = $(this).closest('tr');
                Swal.fire({
                    title: "Are you sure?",
                    text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Yes, delete it!"
                }).then(async (result) => {
                    if (result.isConfirmed){
                        nsAjaxPost(form.attr('action'), form.serialize())
                        .then(res => {
                            table.draw();
                            message(res);
                        })
                        .catch(err => {
                            message(err);
                        });
                    }
                });
            });
            
            $(document).on('click', '.event', function(e) {
                e.preventDefault();
                let transaction_id = $(this).attr('transaction_id');
                Swal.fire({
                    title: "Are you sure?",
                    text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#198754",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Approve",
                    cancelButtonText: "Cancel",
                }).then((result) => {
                    if (result.isConfirmed) {
                        const url = `{{ route('sales.approve', ":id") }}`.replace(':id', transaction_id);
                        $.ajax({
                            url: url,
                            method: 'GET',
                            dataType: 'JSON',
                            success: function(res) {
                                message(res);
                                table.draw();
                            },
                            error: function(xhr, status, error) {
                                message(xhr.responseJSON);
                            }
                        });
                    }
                });

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
            return !(input.is_enabled) ? ' disabled custom-disabled ' : ''; 
        }

    </script>
@endsection
