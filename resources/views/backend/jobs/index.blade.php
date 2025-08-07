@extends('layouts.admin.master')
@section('content')
    @inject('authorization', 'App\Services\AuthorizationService')
    @php
        $roleType = Auth::guard('admin')->user()->type;
        $customer_id = Auth::guard('admin')->user()->agent_id;
        $edit = $authorization->hasMenuAccess(156) == true ? 1 : 0;
        $delete = $authorization->hasMenuAccess(157) == true ? 1 : 0;
        $approve = $authorization->hasMenuAccess(158) == true ? 1 : 0;
        $view = $authorization->hasMenuAccess(159) == true ? 1 : 0;
        $print = $authorization->hasMenuAccess(160) == true ? 1 : 0;
        $payment = $authorization->hasMenuAccess(161) == true ? 1 : 0;
        $add_new_item = $authorization->hasMenuAccess(185) == true ? 1 : 0;
        $token = $authorization->hasMenuAccess(188) == true ? 1 : 0;
        $service_status_update = $authorization->hasMenuAccess(186) == true ? 1 : 0;
        $colSize = $roleType == 2 ? 6 : 4;
    @endphp
    <style>
        .custom-disabled {
            cursor: not-allowed !important;
            pointer-events: none !important;
        }
        .copy-cell{
            position: relative;
            cursor: pointer;
            display: flex;
            justify-content: center;
            gap: 5px;
        }
        .copy-cell .copy-icon{
            display: none;
            color: #000000;
        }
        .copy-cell:hover .copy-icon {
            display: inline;
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
                                <div class="card-title">
                                    @if ($authorization->hasMenuAccess(155))
                                        <a href="{{ route('sales.create') }}"class="btn btn-light shadow rounded m-0"><i
                                                class="fas fa-plus"></i>
                                            <span>Add New</span></i></a>
                                    @endif
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group col-sm-12 col-md-{{ $colSize }} col-lg-{{ $colSize }}" {{ $roleType == 2 ? 'hidden' : null }}>
                                        <label>Agents *</label>
                                        <select class="form-control filter select2" id="customer_id" name="customer_id">
                                            <option value="0">All Agents</option>
                                            @foreach ($data['customers'] as $customers)
                                                <option @selected(Auth::guard('admin')->user()->agent_id == $customers['id']) value="{{ $customers['id'] }}">
                                                    {{ $customers['name'] }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group col-sm-12 col-md-{{ $colSize }} col-lg-{{ $colSize }}">
                                        <label>Status Filter *</label>
                                        <select class="form-control filter select2" id="status_filter" name="status_filter">
                                        <option value="">Any</option>
                                        <optgroup label="Job Status">
                                            <option class="text-danger" value="job_status.0">Pending Job</option>
                                            <option value="job_status.1">Procesing Job</option>
                                            <option value="job_status.2">Completed Job</option>
                                            <option value="job_status.3">Refunded Job</option>
                                            <option value="job_status.4">Cancelled Job</option>
                                        </optgroup>
                                        <optgroup label="Service Status">
                                            <option value="service_status.2">Today Medical Completed</option>
                                            <option value="service_status.3">Waiting For Medical Result</option>
                                            <option value="service_status.7">Settlement Pending</option>
                                            <option value="service_status.8">Settlement Requests</option>
                                            <option value="service_status.12">Slip Request</option>
                                            <option value="service_status.16">Online On Wafid</option>
                                            <option value="service_status.18">MOFA Request</option>
                                            <option value="service_status.23">FIT Card Request</option>
                                            <option value="service_status.25">FIT Card Ready</option>
                                            <option value="service_status.26">FIT Card Delivery Done</option>
                                        </optgroup>
                                    </select>
                                    </div>
                                    <div class="form-group col-sm-12 col-md-{{ $colSize }} col-lg-{{ $colSize }}">
                                        <label>Remaining Days *</label>
                                        <select class="form-control filter select2" id="remaining_days"
                                            name="remaining_days">
                                            <option value="">Any</option>
                                            <option value="0">Today Expiring</option>
                                            <option value="-1">Expired</option>
                                            <option value="5">0-5</option>
                                            <option value="10">0-10</option>
                                            <option value="20">0-20</option>
                                            <option value="30">0-30</option>
                                            <option value="40">0-40</option>
                                            <option value="55">0-55</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12">
                                        <div class="bootstrap-data-table-panel">
                                            <div class="table-responsive">
                                                <table id="dataTable"
                                                    class="table table-sm table-striped table-bordered table-centre text-center d-flex-justify-contenent">
                                                    <thead>
                                                        <tr>
                                                            <th>Action</th>
                                                            <th>Status</th>
                                                            <th style="min-width: 1200px;text-align: center;">Service Details</th>
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
                                        <input value="{{ date('Y-m-d') }}" type="date" class="form-control"
                                            name="date" id="date" placeholder="0.00">
                                    </div>
                                    <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                        <label>Payment Methods *</label>
                                        <select class="form-control" name="account_id" id="account_id" required>
                                            <option selected value=''>Select Payment Methods</option>
                                            @foreach ($data['paymentMethods'] as $paymentMethod)
                                                <option account-bal="{{ $paymentMethod['balance'] }}"
                                                    @selected(isset($data['item']) && $data['item']['account_id'] == $paymentMethod['id']) value="{{ $paymentMethod['id'] }}">
                                                    {{ $paymentMethod['name'] . ' : ' . $paymentMethod['account_no'] . ' (Bal: ' . $paymentMethod['balance'] }}
                                                    &#2547;)</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                        <label>Due Amount</label>
                                        <input readonly value="0.00" type="number" class="form-control" name="due_amount"
                                            id="due_amount" placeholder="0.00">
                                    </div>
                                    <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                        <label>Paid Amount</label>
                                        <input value="0.00" type="number" class="form-control" name="amount"
                                            id="amount" placeholder="0.00">
                                    </div>
                                    <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                        <label>Note</label>
                                        <input type="text" class="form-control" name="note" id="note"
                                            placeholder="Note">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button id="cancel" type="button" class="btn btn-secondary"
                                    data-dismiss="modal">Cancel</button>
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
        
        let rollType = "{{ $roleType }}";

        $('#status_filter').on('change', function() {
            const url = new URL(window.location.href);
            url.searchParams.delete('status_filter_type');
            url.searchParams.delete('status_filter_value');
            window.history.pushState({}, '', url);

        });
        $(document).ready(function() {
            let customer_id = "{{ $customer_id }}";
            const hasPermission = {
                edit: parseInt("{{ $edit }}"),
                delete: parseInt("{{ $delete }}"),
                approve: parseInt("{{ $approve }}"),
                view: parseInt("{{ $view }}"),
                print: parseInt("{{ $print }}"),
                payment: parseInt("{{ $payment }}"),
                add_new_item: parseInt("{{ $add_new_item }}"),
                service_status_update: parseInt("{{ $service_status_update }}"),
                token: parseInt("{{ $token }}"),
            };
            $(document).on('click', '.pay-now', function(e) {
                $('#sale_id').val($(this).attr('sale-id'));
                $('#amount').val(parseFloat($(this).attr('due')).toFixed(2));
                $('#due_amount').val(parseFloat($(this).attr('due')).toFixed(2));
            });
            $('#form-submit').submit(function(e) {
                let paid_amount = parseFloat($('#amount').val());
                let due = parseFloat($('#due_amount').val());
                if (paid_amount > due) {
                    e.preventDefault();
                    Swal.fire("Couldn't be pay more then payable!");
                }
            });



            var table = $('#dataTable').DataTable({
                pageLength: 100,
                processing: true,
                serverSide: true,
                ajax: {
                    url: '{{ route("sales.list") }}',
                    type: 'GET',
                    data: function(d) {
                        let status_filter_type = null;
                        let status_filter_value = null;
                        let params = new URLSearchParams(window.location.search);
                        status_filter_type = (params.has('status_filter_type') && params.get(
                            'status_filter_type')) || null;
                        status_filter_value = (params.has('status_filter_value') && params.get(
                            'status_filter_value')) || null;

                        if (params.has('status_filter_type') && params.has('status_filter_value')) {
                            $('#status_filter').val(status_filter_type + '.' + status_filter_value)
                                .trigger('change.select2');
                        } else {
                            const status_filter = $('#status_filter option:selected').val() || null;
                            if (status_filter != null) {
                                const status_filter_arr = status_filter.split('.');
                                status_filter_type = status_filter_arr[0];
                                status_filter_value = status_filter_arr[1];
                            } else {
                                status_filter_type = null;
                                status_filter_value = null;
                            }
                        }
                        const customer_id = $('#customer_id').val();
                        const remaining_days = $('#remaining_days').val();

                        d.customer_id = customer_id || (rollType == 2 ? "{{ $customer_id }}" : 0);
                        d.remaining_days = remaining_days || null;
                        d.status_filter_type = status_filter_type;
                        d.status_filter_value = status_filter_value;
                        d._token = $('meta[name="csrf-token"]').attr('content');
                    }
                },
                columns: [
                    {
                        data: null,
                        orderable: false,
                        searchable: false,
                        render: function(data, type, row, meta) {
                            return actionButtons(hasPermission,row,rollType);
                        }
                    },
                    {
                        data: null,
                        name: 'sales.status',
                        orderable: true,
                        searchable: false,
                        render: function(data, type, row, meta) {
                            return jobSatus(hasPermission, row);
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
                            let remaining_days_obj = {};
                            if (row.serviceshorts.length) {
                                row.serviceshorts.forEach(job_service_record => {
                                    let medicalCenterTxt = '';
                                    let serviceNotPurchaseEvent = '';
                                    let serviceNamePrefix = '';


                                    if (job_service_record.medical_centers != null) {
                                        let centersArray = job_service_record
                                            .medical_centers.split('|');
                                        centersArray.forEach((center, index) => {
                                            medicalCenterTxt += center.split(':')[
                                                2] + ((index + 1) < centersArray
                                                    .length ? ', ' : '');
                                        });
                                    }

                                    statusTxt = job_service_record.servicestatus.name;
                                    statusColor = job_service_record.servicestatus
                                        .color_code;

                                    if (hasPermission.service_status_update) {
                                        let status_id = [7, 11, 17, 22];
                                        if (customer_id && !status_id.includes(
                                                job_service_record.status_id)) {
                                            serviceUrl = 'javascript:void(0)';
                                        } else {
                                            serviceUrl =
                                                `{{ route('sales.service-edit', [':saleId', ':serviceRId']) }}`
                                                .replace(':saleId', row.id).replace(
                                                    ':serviceRId', job_service_record.id);
                                        }
                                    }

                                    if (job_service_record.is_complete == '1' && rollType == 1) {
                                        ServiceColor = 'success';
                                    } else if (job_service_record.is_complete == '1' && rollType != 1) {
                                        ServiceColor = 'success';
                                        serviceUrl = 'javascript:void(0)';
                                    } else {
                                        if (job_service_record.is_enabled == '1') {
                                            ServiceColor = 'primary';
                                        } else {
                                            ServiceColor = 'info';
                                        }
                                    }
                                    if (job_service_record.is_agent_purchased == '0') {
                                        serviceUrl = 'javascript:void(0)';
                                        serviceNotPurchaseEvent =
                                            ' serviceNotPurchaseEvent ';
                                        serviceNamePrefix =
                                            '<i class="fa fa-ban text-danger"></i>&nbsp;';
                                    }
                                    remaining_days_obj = remaining_days({
                                        expire_date: job_service_record.expire_date,
                                        is_complete: job_service_record.is_complete,
                                        item_id: job_service_record.item_id
                                    });
                                    tr += `<tr>
                                                <td class="p-0" style="vertical-align: middle;width: auto;">
                                                    <a ${disabled} style="width: 100%;" href="${serviceUrl}" class="${btnControl({is_enabled : job_service_record.is_enabled, is_complete : job_service_record.is_complete})} btn btn-sm btn-${ServiceColor} m-0${serviceNotPurchaseEvent}" aria-disabled="true">${serviceNamePrefix}${job_service_record.items.name}</a>
                                                </td>
                                                <td class="p-0" style="vertical-align: middle;width: auto;text-align: center;">
                                                    <span style="background-color:${statusColor};color:white;width: 100%;" class="badge badge-lg text-light">${statusTxt}</span>
                                                </td>
                                                <td style="vertical-align: middle;width: auto;">${job_service_record.entry_date ?? ''}</td>
                                                <td style="vertical-align: middle;width: auto;">${job_service_record.expire_date ?? ''}</td>
                                                <td style="vertical-align: middle;width: auto;background-color: ${remaining_days_obj.hasExpireDate && (remaining_days_obj.remaining_days!=null && remaining_days_obj.remaining_days>=0) ? getColorFromPercentage(remaining_days_obj.maxRemainingDays, remaining_days_obj.remaining_days) : ''}">${remaining_days_obj.remaining_days_label}</td>
                                                <td style="vertical-align: middle;width: auto;word-break: normal; white-space: normal;">${medicalCenterTxt}</td>
                                                <td style="vertical-align: middle;width: auto;word-break: normal; white-space: normal;">${job_service_record.slip_no || job_service_record.mofa_no || ''}</td>
                                                <td style="vertical-align: middle;width: auto;word-break: normal; white-space: normal;">${job_service_record.remarks ?? ''}</td>
                                            </tr>`;
                                });
                                let paymentStatusColor;
                                let paymentText;
                                if (row.payment_status == '0') {
                                    paymentStatusColor = 'warning';
                                    paymentText = 'Unpaid';
                                } else if (row.payment_status == '1') {
                                    paymentStatusColor = 'success';
                                    paymentText = 'Paid';
                                }
                                let img_src = row.passport_img != null ?
                                    `{{ asset('public/uploads/passports/:file') }}`.replace(
                                        ':file', row.passport_img) : '';
                                table = `
                                            <table class="table table-sm table-striped table-info table-center rounded m-0">
                                                <thead>
                                                    <tr class="bg-info">
                                                        <th class="text-center" colspan="2"><span style="color: black;">Job No: </span><br><a href="${`{{ route('sales.invoice', ':id') }}`.replace(':id', row.id)}" style="text-decoration: none; color: inherit;"><b>#${row.invoice_no}</b></a></th>
                                                        <th class="text-center" colspan="2"><span style="color: black;">Agent Code: </span><br>${row.customer_code.toUpperCase()}</th>
                                                        <th class="text-center" colspan="2">
                                                            <span style="color: black;">Passenger Name: </span><br>
                                                            <div class="copy-cell">
                                                                <span class="copy-icon" data-toggle="tooltip">
                                                                    <i class="fas fa-copy"></i>
                                                                </span>
                                                                <span class="text-to-be-copied">
                                                                    ${row.passenger_name.toUpperCase()}
                                                                </span>
                                                            </div>
                                                        </th>
                                                        <th class="text-center" colspan="1">
                                                            <span style="color: black;">Passport: </span><br>
                                                            <div class="copy-cell">
                                                                <span class="copy-icon" data-toggle="tooltip">
                                                                    <i class="fas fa-copy"></i>
                                                                </span>
                                                                <span class="text-to-be-copied">
                                                                    ${row.passenger_passport_no.toUpperCase()}
                                                                </span>
                                                                <span>
                                                                    ${row.passport_img !=null ? `<a href="javascript:void(0)" onclick="downloadImage('${img_src}')"><i class="fa-solid fa-download text-danger shadow"></i></a>` : ''}
                                                                </span>
                                                            </div>
                                                        </th>
                                                        <th class="text-center" colspan="1"><span style="color: black;">Localhost No: </span><br>${ row.localhost_no ? row.localhost_no.toUpperCase() : '-' }</th>
                                                    </tr>
                                                    <tr class="bg-light">
                                                        <th class="text-center" colspan="1">Date: ${row.date}</th>
                                                        <th class="text-center" colspan="1"><div class="text-center">Paid: <span class="text-success fw-bold"><b>${row.paid_amount}</b></span> | Due: <span class="text-danger fw-bold"><b>${row.total_payable - row.paid_amount}</b></span></div></th>
                                                        <th class="text-center" colspan="2">Payment Status: ${`<span class="badge badge-${paymentStatusColor}">${paymentText}</span>`}</th>
                                                        <th class="text-center" colspan="1">CC:- ${row.country_code ?? ''}</th>
                                                        <th class="text-center" colspan="2">MC:- ${row.medical_name ?? ''}</th>
                                                        <th class="text-center" colspan="1">Note: ${row.note ?? ''}</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="text-center" style="width: 150px;">ServiceName</th>
                                                        <th class="text-center" style="width: 150px;">Status</th>
                                                        <th class="text-center" style="width: 80px;">EntryDate</th>
                                                        <th class="text-center" style="width: 80px;">ExpireDate</th>
                                                        <th class="text-center" style="width: 80px;">R.Day</th>
                                                        <th class="text-center" style="width: 200px;">Centers</th>
                                                        <th class="text-center" style="width: 150px;">Slip/MOFA_No</th>
                                                        <th class="text-center" style="width: 350px;">Results/Remarks</th>
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
                search: {
                    return: false
                },
                drawCallback: function(){
                    $('[data-toggle="tooltip"]').tooltip();
                    $('.copy-cell .copy-icon').on('click', function(e){
                        const textElement = $(this).siblings('.text-to-be-copied');
                        const text = textElement.text().trim();
                        console.log(navigator);
                        navigator.clipboard.writeText(text).then(()=>{
                            $(this).attr('data-original-title', 'Copied!').tooltip('show');
                            setTimeout(()=>{
                                $(this).tooltip('hide').attr('data-original-title', '');
                            }, 1000);
                        });
                    });
                }
            });
            $(document).on('change', '.filter', function() {
                table.draw();
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
                    if (result.isConfirmed) {
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
                        const url = `{{ route('sales.approve', ':id') }}`.replace(':id',
                            transaction_id);
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
            $(document).on('click', '.serviceNotPurchaseEvent', function(e) {
                Swal.fire("Please buy this service!");
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

        function btnControl(input) {
            return input.is_complete == '0' && input.is_enabled == '0' ? ' disabled custom-disabled ' : '';
        }

        function getColorFromPercentage(range, actualValue) {
            if (range === 0) {
                console.warn("Range cannot be zero. Returning a default white color.");
                return "rgb(255, 255, 255)";
            }
            let percentage = (actualValue / range) * 100;
            percentage = Math.max(0, Math.min(100, percentage));
            const hue = percentage * 1.2;
            const saturation = 100;
            const lightness = 50;

            return `hsl(${hue}, ${saturation}%, ${lightness}%)`;
        }

        function remaining_days(input) {
            const obj = {
                remaining_days: null,
                remaining_days_label: '',
                hasExpireDate: false,
                maxRemainingDays: 0
            };
            if (input.expire_date != null) {
                obj.hasExpireDate = true;
                obj.maxRemainingDays = [1, 2, 3].includes(input.item_id) ? 25 : input.item_id == 4 ? 55 : 0;

                if (input.is_complete == '1') {
                    obj.remaining_days_label = '<span class="badge badge-success">Done</span>';
                } else {
                    let remaining_days = getDateDifferenceInDays(new Date(), input.expire_date);
                    if (remaining_days >= 0) {
                        obj.remaining_days = remaining_days;
                        obj.remaining_days_label = remaining_days;
                    } else {
                        obj.remaining_days_label = '<span class="badge badge-danger">Expired</span>';
                    }
                }
            }
            return obj;
        }

        function downloadImage(url) {
            const link = document.createElement('a');
            link.href = url;
            link.download = url.split('/').pop();
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }
        function jobSatus(hasPermission,row) {
            let color;
            let text;
            let eventClass = '';
            if (row.status == '0') {
                color = 'danger';
                text = 'Pending';
                if (hasPermission.approve) {
                    eventClass = 'event';
                }
            } else if (row.status == '1') {
                color = 'primary';
                text = 'Processing';
            } else if (row.status == '2') {
                color = 'success';
                text = 'Completed';
            } else if (row.status == '3') {
                color = 'dark';
                text = 'Refunded';
            } else if (row.status == '4') {
                color = 'secondary';
                text = 'Cancelled';
            }
            return `<button transaction_id=${row.id} type="button" class="btn btn-sm btn-${color} ${eventClass}">${text}</button>`;
        }
        function actionButtons(hasPermission,row,rollType) {
            let addNewItem = `{{ route('sales.add-new-item', ':id') }}`.replace(':id', row.id);
            let edit = `{{ route('sales.edit', ':id') }}`.replace(':id', row.id);
            let print = `{{ route('sales.invoice.print', [':id', 'print']) }}`.replace(':id', row.id);
            let token = `{{ route('sales.token.print', [':id', 'print']) }}`.replace(':id', row.id);
            let view = `{{ route('sales.invoice', [':id']) }}`.replace(':id', row.id);
            let destroy = `{{ route('sales.destroy', ':id') }}`.replace(':id', row.id);
            let action = ` <div>`;

            if (hasPermission.token) action += `<a style="width: 35px;width: 35px;" href="${token}" class="btn btn-sm btn-secondary"><i class="fa-solid fa-receipt"></i></a><br>`;
            if (hasPermission.view) action += `<a style="width: 35px;width: 35px;" href="${view}" class="btn btn-sm btn-warning"><i class="fa-solid fa-eye"></i></a><br>`;
            if (hasPermission.print) action += `<a style="width: 35px;width: 35px;" href="${print}" class="btn btn-sm btn-dark"><i class="fa-solid fa-print"></i></a><br>`;
            if (hasPermission.payment) action += `<button style="width: 35px;width: 35px;" due="${row.total_payable - row.paid_amount}" sale-id="${row.id }" type="button" class="btn btn-success btn-sm pay-now" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap" ${(row.total_payable - row.paid_amount)==0? 'disabled' : null}><i class="fa-solid fa-hand-holding-dollar"></i></button><br>`;
            if (hasPermission.add_new_item) action += `<a style="width: 35px;width: 35px;" href="${addNewItem}" class="btn btn-sm btn-primary ${row.status == '2' ? "disabled" : null}"><i class="fa-solid fa-plus"></i></a><br>`;
            if (hasPermission.edit) action += `<a style="width: 35px;width: 35px;" href="${edit}" class="btn btn-sm btn-info ${row.status != '0' && rollType != 1 ? 'disabled' : null}"><i class="fa-solid fa-pen-to-square"></i></a><br>`;
            if (hasPermission.delete){
                action += `<form class="delete" action="${destroy}" method="post">
                                    @csrf
                                @method('DELETE')
                                <button style="width: 35px;width: 35px;" type="submit" class="btn btn-sm btn-danger" ${row.status != '0' ? "disabled" : null}>
                                    <i class="fa-solid fa-trash-can"></i>
                                </button>
                        </form>`;
            }
            action += `</div>`;
            return action;
        }

    </script>
@endsection
