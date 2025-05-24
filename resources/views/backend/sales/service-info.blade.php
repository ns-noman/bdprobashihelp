@extends('layouts.admin.master')
@section('content')
@php
    use Carbon\Carbon;
@endphp
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
                            <form id="form-submit" action="{{ route('sales.service-update',$data['jobServiceRecord']['id']) }}" method="POST" enctype="multipart/form-data">
                                @csrf()
                                @method('put')
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="form-group col">
                                                    <label>Agent Name</label>
                                                    <input value="{{ $data['customer_name'] }}" name="customer_id" id="customer_id" class="form-control" disabled>
                                                </div>
                                                <div class="form-group col">
                                                    <label>Passenger Name</label>
                                                    <input disabled name="passenger_name" id="passenger_name" type="text" value="{{ $data['sale']['passenger_name'] }}" class="form-control" placeholder="Passenger Name" disabled>
                                                </div>
                                                <div class="form-group col">
                                                    <label>Passport No</label>
                                                    <input disabled name="passenger_passport_no" id="passenger_passport_no" type="text" value="{{ $data['sale']['passenger_passport_no'] }}" class="form-control" placeholder="0123456789" required>
                                                </div>
                                                <div class="form-group col">
                                                    <label>Service Name</label>
                                                    <input type="text" value="{{ $data['jobServiceRecord']['item_name'] }}" class="form-control" disabled>
                                                </div>
                                                <div class="form-group col">
                                                    <label>Status *</label>
                                                    <select name="status_id" id="status_id" class="form-control select2">
                                                        @foreach ($data['statusList'] as $statusList)
                                                            <option @selected($data['jobServiceRecord']['status_id'] == $statusList['id']) value="{{ $statusList['id'] }}">{{ $statusList['id'] }}: {{ $statusList['name'] }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="form-group col" id="entry_date_div" hidden>
                                                    <label id="entry_date_label">Entry Date *</label>
                                                    <input name="entry_date" id="entry_date" type="date" value="" class="form-control">
                                                </div>
                                                <div class="form-group col" id="expire_date_div" hidden>
                                                    <label id="expire_date_label">Expire Date *</label>
                                                    <input name="expire_date" id="expire_date" type="date" value="{{ !empty($data['jobServiceRecord']['expire_date']) ? $data['jobServiceRecord']['expire_date'] : date('Y-m-d') }}" class="form-control">
                                                </div>
                                                <div class="form-group col-sm-12 col-md col-lg" id="medical_center_ids_div" hidden>
                                                    <div class="form-group">
                                                        <label id="medical_center_ids_label">Medical Centers</label>
                                                        <select class="select2" name="medical_center_ids[]" id="medical_center_ids" multiple="multiple" data-placeholder="Select Package Items" style="width: 100%;">
                                                            @foreach ($data['centers'] as $center)
                                                                <option value="{{ $center['id'] }}"
                                                                >{{ $center['name'] }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group col" id="remarks_div" hidden>
                                                    <label  id="remarks_label">Remarks</label>
                                                    <input name="remarks" id="remarks" type="text" @disabled(!empty($data['jobServiceRecord']['remarks'])) value="{{ !empty($data['jobServiceRecord']['remarks']) ? $data['jobServiceRecord']['remarks'] : null }}" class="form-control" placeholder="Remarks">
                                                </div>
                                            </div>
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
@php
    $entry_date_obj = Carbon::now();
    $expireDateForMedical_obj = (clone $entry_date_obj)->addDays(25);
    $expireDateForMOFA_obj = (clone $entry_date_obj)->addDays(55);
    $entry_date = $entry_date_obj->toDateString();
    $expireDateForMedical = $expireDateForMedical_obj->toDateString();
    $expireDateForMOFA = $expireDateForMOFA_obj->toDateString();
@endphp
@section('script')
    <script>
        $(document).ready(function(){

            $('#status_id').on('change', function(e) {
                let status_id = parseInt($(this).val());

                ['entry_date','expire_date','medical_center_ids','remarks'].forEach(element => {
                    ctrlElement({element_id: element,hidden: true,txtLabel: '', required: false, disabled: true,defaultValue: null});
                });

                switch (status_id) {
                case 2:
                   
                    let entry_date = "{{ $entry_date }}";  
                    let expireDateForMedical = "{{ $expireDateForMedical }}";
                     ctrlElement({element_id: 'entry_date',hidden: false,txtLabel: 'Medical Entry Date *', required: true, disabled: false,defaultValue: entry_date});
                     ctrlElement({element_id: 'expire_date',hidden: false,txtLabel: 'Medical Expire Date *', required: true, disabled: false,defaultValue: expireDateForMedical});
                    break;
                case 4:
                    ctrlElement({element_id: 'remarks',hidden: false,txtLabel: 'Medical Result', required: true, disabled: false,defaultValue: null});
                    break;
                case 6:
                    ctrlElement({element_id: 'medical_center_ids',hidden: false,txtLabel: 'Medical Centers *', required: true, disabled: false,defaultValue: null});
                    ctrlElement({element_id: 'remarks',hidden: false,txtLabel: 'Medical Result', required: true, disabled: false,defaultValue: null});
                    break;
                case 8:
                    ctrlElement({element_id: 'entry_date',hidden: true,txtLabel: 'Entry Date', required: true, disabled: false,defaultValue: "{{ Date('Y-m-d') }}" });
                    break;
                case 12:
                    ctrlElement({element_id: 'medical_center_ids',hidden: false,txtLabel: 'Medical Centers *', required: true, disabled: false,defaultValue: null});
                    ctrlElement({element_id: 'entry_date',hidden: true,txtLabel: 'Entry Date', required: true, disabled: false,defaultValue: "{{ Date('Y-m-d') }}" });
                    break;
                case 16:
                    let expireDateForMofa = "{{ $expireDateForMOFA }}";
                    ctrlElement({element_id: 'expire_date',hidden: false,txtLabel: 'MOFA Expire Date *', required: true, disabled: false,defaultValue: expireDateForMofa});
                    break;
                case 23:
                    ctrlElement({element_id: 'medical_center_ids',hidden: false,txtLabel: 'Medical Centers *', required: true, disabled: false,defaultValue: null});
                    break;
                default:
                    console.log("Hello");
                }

            });

            function ctrlElement(data) {
                $(`#${data.element_id}_div`).attr('hidden', data.hidden);
                $(`#${data.element_id}_label`).html(data.txtLabel);
                $(`#${data.element_id}`).attr('required', data.required);
                $(`#${data.element_id}`).attr('disabled', data.disabled);
                $(`#${data.element_id}`).attr('placeholder', data.txtLabel);
                $(`#${data.element_id}`).val(data.defaultValue);
            }
            
            $('#form-submit').submit(function(e) {
                let paid_amount = parseFloat($('#amount').val());
                let due = parseFloat($('#due_amount').val());
                if(paid_amount>due){
                    e.preventDefault();
                    Swal.fire("Couldn't be pay more then payable!");
                }
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
        // function getDateDifferenceInDays(start_date, end_date) {
        //     const d1 = new Date(start_date);
        //     const d2 = new Date(end_date);
        //     d1.setHours(0, 0, 0, 0);
        //     d2.setHours(0, 0, 0, 0);
        //     const diffInMs = d2 - d1;
        //     const diffInDays = Math.round(diffInMs / (1000 * 60 * 60 * 24));
        //     return diffInDays;
        // }
        // function btnControl(input){
        //     return !(input.is_enabled) ? ' disabled custom-disabled ' : ''; 
        // }

    </script>
@endsection

