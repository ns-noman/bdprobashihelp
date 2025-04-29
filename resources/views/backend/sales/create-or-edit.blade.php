@extends('layouts.admin.master')
@section('content')
<style>
    table td, table th{
        padding: 3px!important;
        text-align: center;
    }
    input[type="number"]{
        text-align: right;
    }
    .item{
        text-align: left;
    }
    .form-group{
        padding: 2px;
        margin: 0px;
    }
    label{
        margin-bottom: 0px;
    }
</style>
    <div class="content-wrapper">
        @include('layouts.admin.content-header')
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">{{ $data['title'] }} Form</h3>
                            </div>
                            <form id="form-submit" action="{{ isset($data['item']) ? route('sales.update',$data['item']->id) : route('sales.store'); }}" method="POST" enctype="multipart/form-data">
                                @csrf()
                                @if(isset($data['item']))
                                    @method('put')
                                @endif 
                                <div class="card-body">
                                    <div class="row">
                                        <div class="form-group col-sm-3 col-md-3 col-lg-3">
                                            <label>Agents *</label>
                                            <select name="agent_id" id="agent_id" class="form-control select2">
                                                @foreach ($data['agents'] as $agent)
                                                    <option {{ (isset($data['item']) && $agent->id == $data['item']->agent_id) ? 'selected' : null }} value="{{ $agent->id }}">{{ $agent->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-3 col-md-3 col-lg-2">
                                            <label>Passenger Name *</label>
                                            <input name="passenger_name" id="passenger_name" type="text" value="{{ isset($data['item']) ? $data['item']->passenger_name : null }}" class="form-control" placeholder="Passenger Name">
                                        </div>
                                        <div class="form-group col-sm-3 col-md-3 col-lg-2">
                                            <label>Passport No *</label>
                                            <input name="passenger_passport_no" id="passenger_passport_no" type="text" value="{{ isset($data['item']) ? $data['item']->passenger_passport_no : null }}" class="form-control" placeholder="0123456789">
                                        </div>
                                        <div class="form-group col-sm-2 col-md-2 col-lg-2">
                                            <label>Date *</label>
                                            <input name="date" id="date" type="date"
                                                value="{{ isset($data['item']) ? $data['item']->date : date('Y-m-d') }}"
                                                class="form-control" required>
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-3">
                                            <label>Service Item</label>
                                            <select class="form-control select2" id="item_id_temp">
                                                <option value="" selected disabled>Select Service Item</option>
                                                @foreach ($data['items'] as $key => $item)
                                                    <option value="{{ $item['id'] }}"
                                                        item_name="{{ $item['name'] }}"
                                                        item_price="{{ $item['price'] }}"
                                                        item_type="{{ $item['item_type'] }}"
                                                        > {{ $item['name'] }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                            <div class="table-responsive">
                                                <table id="table"
                                                    class="table table-striped table-bordered table-centre p-0 m-0">
                                                    <thead>
                                                        <tr>
                                                            <th width="5%">SN</th>
                                                            <th width="40%">Item</th>
                                                            <th width="10%">Price</th>
                                                            <th width="5%">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tbody">
                                                        @isset($data['saleDetails'])
                                                            @foreach ($data['saleDetails'] as $sd)
                                                                <tr>
                                                                    <td class="serial">{{ $loop->iteration }}</td>
                                                                    <td class="text-left">
                                                                        <input type="hidden" value="{{ $sd['item_id'] ? $sd['item_id'] : $sd['service_id'] }}" name="item_id[]">
                                                                        <input type="hidden" value="{{ $sd['item_type'] }}" name="item_type[]">
                                                                    </td>
                                                                    <td><input type="number" value="{{ $sd['unit_price'] }}" class="form-control form-control-sm calculate" name="unit_price[]" placeholder="0.00" required></td>
                                                                    <td><button class="btn btn-sm btn-danger btn-del" type="button"><i class="fa-solid fa-trash btn-del"></i></button></td>
                                                                </tr>
                                                            @endforeach
                                                        @endisset
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group col-sm-3 col-md-3 col-lg-4">
                                            <label>Total Amount</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->total_price : null }}" type="number" class="form-control" name="total_price" id="total_price" placeholder="0.00" readonly>
                                        </div>
                                        <div class="form-group col-sm-3 col-md-3 col-lg-4">
                                            <label>Paid Amount</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->paid_amount : null }}" value="0.00" step="0.01" type="number" 
                                                class="form-control" name="paid_amount"
                                                id="paid_amount" placeholder="0.00">
                                        </div>
                                        <div class="form-group col-sm-3 col-md-3 col-lg-4">
                                            <label>Payment Methods *</label>
                                            <select class="form-control" name="account_id" id="account_id">
                                                <option selected value=''>Select Payment Methods</option>
                                                @foreach ($data['paymentMethods'] as $paymentMethod)
                                                    <option account-bal="{{ $paymentMethod['balance'] }}" @selected((isset($data['item']) && $data['item']['account_id'] == $paymentMethod['id']) || 1 == $paymentMethod['id']) value="{{ $paymentMethod['id'] }}">{{ $paymentMethod['name'] .' : '. $paymentMethod['account_no'] . ' (Bal: ' . $paymentMethod['balance'] }} &#2547;)</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Refference Number</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->reference_number : null }}"
                                                class="form-control" type="text" name="reference_number" id="reference_number"
                                                placeholder="Reference Number">
                                        </div>
                                        <div class="form-group col-sm-8 col-md-8 col-lg-8">
                                            <label>Note</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->note : null }}"
                                                class="form-control" type="text" name="note" id="note"
                                                placeholder="Note">
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection

@section('script')
    <script>
        $(document).ready(function() {

            $('#item_id_temp').on('change', function(e) {
                let item_id = $('#item_id_temp').val();
                let item_name = $('#item_id_temp option:selected').attr('item_name');
                let item_price = $('#item_id_temp option:selected').attr('item_price');
                let item_type = $('#item_id_temp option:selected').attr('item_type');
                if (checkDuplicate(item_id)) return duplicateAlert();
                let tbody =  ``;
                tbody += `<tr>
                            <td class="serial"></td>
                            <td class="text-left">
                                ${item_name}
                                <input type="hidden" value="${item_id}" name="item_id[]">
                                <input type="hidden" value="${item_type}" name="item_type[]">    
                            </td>
                            <td><input type="number" value="${item_price}" class="form-control form-control-sm calculate" name="unit_price[]" placeholder="0.00" required></td>
                            <td><button class="btn btn-sm btn-danger btn-del" type="button"><i class="fa-solid fa-trash btn-del"></i></button></td>
                        </tr>`;

                $('#tbody').append(tbody);
                $(".serial").each(function(index) { $(this).html(index + 1);});
                $('#item_id_temp').val('');
                calculate();
            });

            $('#table').bind('keyup, input', function(e) {
                if ($(e.target).is('.calculate')) {
                    calculate();
                }
            });
            $('#tbody').bind('click', function(e) {
                $(e.target).is('.btn-del') && e.target.closest('tr').remove();
                $(".serial").each(function(index) {
                    $(this).html(index + 1);
                });
                calculate();
            });
        });
        $('#form-submit').submit(function(e) {
            if (!$('input[name="item_id[]"]').length) {
                e.preventDefault();
                Swal.fire("Please Insert Item!");
            }
            if(parseFloat($('#paid_amount').val())>parseFloat($('#total_price').val())){
                e.preventDefault();
                Swal.fire("Couldn't be pay more then payable!");
            }
            if(parseFloat($('#paid_amount').val())>0 && !$('#account_id option:selected').val()){
                e.preventDefault();
                Swal.fire("Please Select Payment Method");
            }
        });
        function calculate() {
            let item_id = $('input[name="item_id[]"]');
            let total_price = 0;
            for (let i = 0; i < item_id.length; i++) {
                let item_type = $('input[name="item_type[]"]')[i].value;
                let unit_price = parseFloat($('input[name="unit_price[]"]')[i].value);
                total_price += unit_price;
            }
            $('#total_price').val(total_price.toFixed(2));
            $('#paid_amount').val(total_price);
        }
        function checkDuplicate(item_id) {
            let isDuplicate = false;
            $('#tbody tr').each(function() {
                let existingItemId = $(this).find('input[name="item_id[]"]').val();
                if ((existingItemId == item_id)) {
                    isDuplicate = true;
                    return false;
                }
            });
            return isDuplicate;
        }
        function duplicateAlert() {
            Swal.fire({
                icon: 'error',
                title: 'Duplicate Item',
                text: 'This Item has already been added!'
            });
        }

    </script>
@endsection
