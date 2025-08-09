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
                                                            <option @selected($data['jobServiceRecord']['status_id'] == $statusList['id']) value="{{ $statusList['id'] }}">{{ $statusList['name_for_agent'] ? $statusList['name_for_agent'] : $statusList['name'] }}</option>
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
                                                    <input name="expire_date" id="expire_date" type="date" value="" class="form-control">
                                                </div>
                                                <div class="form-group col-sm-12 col-md col-lg" id="medical_center_ids_div" hidden>
                                                    <div class="form-group">
                                                        <label id="medical_center_ids_label">Medical Centers</label>
                                                        <select class="select2" name="medical_center_ids[]" id="medical_center_ids" multiple="multiple" data-placeholder="Select Package Items" style="width: 100%;" @readonly(true)>
                                                            @foreach ($data['centers'] as $center)
                                                                <option value="{{ $center['id'] }}"
                                                                >{{ $center['name'] }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group col" id="slip_no_div" hidden>
                                                    <label id="slip_no_label">Slip No *</label>
                                                    <input name="slip_no" id="slip_no" type="text" value="" class="form-control">
                                                </div>
                                                <div class="form-group col" id="mofa_no_div" hidden>
                                                    <label id="mofa_no_label">MOFA No *</label>
                                                    <input name="mofa_no" id="mofa_no" type="text" value="" class="form-control">
                                                </div>
                                                <div class="form-group col" id="remarks_div" hidden>
                                                    <label  id="remarks_label">Remarks</label>
                                                    <input name="remarks" id="remarks" type="text" value="" class="form-control" placeholder="Remarks">
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
@section('script')
    <script>
        $(document).ready(function(){
            onLoad();
            $('#medical_center_ids').on('select2:select', function(e) {
                let status_id = parseInt($('#status_id option:selected').val());
                if (status_id == 12) {
                    let lastUpdatevalue = e.params.data.id;
                    $(this).val(lastUpdatevalue).trigger('change.select2');
                }
            });
            $('#entry_date').on('change', function(e) {
                let status_id = parseInt($('#status_id').val());
                let entry_date = new Date($(this).val());
                let addDay = 0;
                if (status_id == 2) {
                    addDay = 25;
                }else if(status_id == 16){
                    addDay = 55;
                }
                let expire_date = formatDateYmd(addDate(entry_date, addDay));
                $('#expire_date').val(expire_date);
            });

            $('#status_id').on('change', function(e) {
                let status_id = parseInt($(this).val());
                ctrlAllElement(status_id);
            });
            function onLoad(){
                let status_id = parseInt($('#status_id option:selected').val());
                ctrlAllElement(status_id);
            }

            function ctrlAllElement(status_id) {
                let entry_date;
                let expire_date;

                ['entry_date','expire_date','medical_center_ids','slip_no','mofa_no','remarks'].forEach(element => {
                    ctrlElement({element_id: element,hidden: true,txtLabel: '', required: false, disabled: true,defaultValue: null});
                });

                switch (status_id) {
                case 2:
                    entry_date = formatDateYmd(new Date());
                    expire_date = formatDateYmd(addDate(entry_date, 25));
                    ctrlElement({element_id: 'entry_date',hidden: false,txtLabel: 'Medical Entry Date *', required: true, disabled: false,defaultValue: entry_date});
                    ctrlElement({element_id: 'expire_date',hidden: false,txtLabel: 'Medical Expire Date *', required: true, disabled: false,defaultValue: expire_date, readonly: true});
                    break;
                case 4:
                    ctrlElement({element_id: 'remarks',hidden: false,txtLabel: 'Medical Result', required: true, disabled: false,defaultValue: null});
                    break;
                case 6:
                    ctrlElement({element_id: 'medical_center_ids',hidden: false,txtLabel: 'Medical Centers *', required: true, disabled: false,defaultValue: null});
                    ctrlElement({element_id: 'remarks',hidden: false,txtLabel: 'Medical Result', required: true, disabled: false,defaultValue: null});
                    break;
                case 8:
                    entry_date = formatDateYmd(new Date());
                    ctrlElement({element_id: 'entry_date',hidden: true,txtLabel: 'Entry Date', required: true, disabled: false,defaultValue: entry_date });
                    break;
                case 12:
                    entry_date = formatDateYmd(new Date());
                    ctrlElement({element_id: 'medical_center_ids',hidden: false,txtLabel: 'Medical Centers *', required: true, disabled: false,defaultValue: null});
                    ctrlElement({element_id: 'entry_date',hidden: true,txtLabel: 'Entry Date', required: true, disabled: false,defaultValue: entry_date });
                    ctrlElement({element_id: 'slip_no',hidden: false,txtLabel: 'Slip No *', required: true, disabled: false,defaultValue: null });
                    break;
                case 16:
                    entry_date = formatDateYmd(new Date());
                    expire_date = formatDateYmd(addDate(entry_date, 55));
                    ctrlElement({element_id: 'entry_date',hidden: false,txtLabel: 'Online WAFID Date *', required: true, disabled: false,defaultValue: entry_date});
                    ctrlElement({element_id: 'expire_date',hidden: false,txtLabel: 'MOFA Expire Date *', required: true, disabled: false,defaultValue: expire_date, readonly: true});
                    break;
                case 18:
                    entry_date = formatDateYmd(new Date());
                    ctrlElement({element_id: 'entry_date',hidden: true,txtLabel: 'Entry Date', required: true, disabled: false,defaultValue: entry_date });
                    ctrlElement({element_id: 'mofa_no',hidden: false,txtLabel: 'MOFA No *', required: true, disabled: false,defaultValue: null });
                    break;
                case 23:
                    entry_date = formatDateYmd(new Date());
                    ctrlElement({element_id: 'entry_date',hidden: true,txtLabel: 'Entry Date', required: true, disabled: false,defaultValue: entry_date });
                    break;
                default:
                    break;
                }
            }
            function ctrlElement(data) {
                $(`#${data.element_id}_div`).attr('hidden', data.hidden);
                $(`#${data.element_id}_label`).html(data.txtLabel);
                $(`#${data.element_id}`).attr('required', data.required);
                $(`#${data.element_id}`).attr('disabled', data.disabled);
                $(`#${data.element_id}`).attr('placeholder', data.txtLabel.replace('*', ''));
                $(`#${data.element_id}`).val(data.defaultValue);
                if(data.hasOwnProperty('readonly')) $(`#${data.element_id}`).attr('readonly', data.readonly);
            }
            
           $('#form-submit').submit(function(e) {
               let medical_center_ids_div = $('#medical_center_ids_div').prop('hidden');
               let medical_center_ids = $('#medical_center_ids').val();
               if(!medical_center_ids_div && medical_center_ids.length < 1){
                   e.preventDefault();
                   Swal.fire("Please Select Medical Center!");
                }
            });
        });
    </script>
@endsection

