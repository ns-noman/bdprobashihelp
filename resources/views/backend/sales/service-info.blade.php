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
                                        <div class="form-group col-sm-3 col-md-3 col-lg-3">
                                            <label>Agent Name</label>
                                            <input value="{{ $data['customer_name'] }}" name="customer_id" id="customer_id" class="form-control" disabled>
                                        </div>
                                        <div class="form-group col-sm-3 col-md-3 col-lg-3">
                                            <label>Passenger Name</label>
                                            <input disabled name="passenger_name" id="passenger_name" type="text" value="{{ $data['sale']['passenger_name'] }}" class="form-control" placeholder="Passenger Name" disabled>
                                        </div>
                                        <div class="form-group col-sm-3 col-md-3 col-lg-3">
                                            <label>Passport No</label>
                                            <input disabled name="passenger_passport_no" id="passenger_passport_no" type="text" value="{{ $data['sale']['passenger_passport_no'] }}" class="form-control" placeholder="0123456789" required>
                                        </div>
                                        <div class="form-group col-sm-2 col-md-2 col-lg-3">
                                            <label>Service Name</label>
                                            <input type="text" value="{{ $data['jobServiceRecord']['item_name'] }}" class="form-control" disabled>
                                        </div>
                                        <div class="col-12">
                                            <div class="row">
                                                @if(in_array($data['jobServiceRecord']['item_id'],[1]))
                                                <div class="form-group col">
                                                    <label>Entry Date *</label>
                                                    <input name="entry_date" id="entry_date" type="date" @disabled(!empty($data['jobServiceRecord']['entry_date'])) value="{{ !empty($data['jobServiceRecord']['entry_date']) ? $data['jobServiceRecord']['entry_date'] : date('Y-m-d') }}" class="form-control" required>
                                                </div>
                                                @endif
                                                @if(in_array($data['jobServiceRecord']['item_id'],[0]))
                                                <div class="form-group col">
                                                    <label>Expire Date *</label>
                                                    <input name="expire_date" id="expire_date" type="date" @disabled(!empty($data['jobServiceRecord']['expire_date'])) value="{{ !empty($data['jobServiceRecord']['expire_date']) ? $data['jobServiceRecord']['expire_date'] : date('Y-m-d') }}" class="form-control" required>
                                                </div>
                                                @endif
                                                @if(in_array($data['jobServiceRecord']['item_id'],[3,5]))
                                                    <div class="form-group col-sm-12 col-md col-lg" >
                                                        <div class="form-group">
                                                            <label>Medical Centers</label>
                                                            <select class="select2" name="medical_center_ids[]" id="medical_center_ids" multiple="multiple" data-placeholder="Select Package Items" style="width: 100%;">
                                                                @foreach ($data['centers'] as $center)
                                                                    <option value="{{ $center['id'] }}" 
                                                                        {{-- {{ isset($data['item']) ? (in_array($center['id'],$data['packageItems']) ? 'selected' : null) : null }} --}}
                                                                    
                                                                    >{{ $center['name'] }}</option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    </div>
                                                @endif
                                                @if(in_array($data['jobServiceRecord']['item_id'],[1]))
                                                <div class="form-group col">
                                                    <label>Remarks</label>
                                                    <input name="remarks" id="remarks" type="text" @disabled(!empty($data['jobServiceRecord']['remarks'])) value="{{ !empty($data['jobServiceRecord']['remarks']) ? $data['jobServiceRecord']['remarks'] : null }}" class="form-control" placeholder="Remarks">
                                                </div>
                                                @endif
                                                <div class="form-group col">
                                                    <label>Status *</label>
                                                    <select name="status_id" id="status_id" class="form-control select2">
                                                        @foreach ($data['statusList'] as $statusList)
                                                            <option @selected($data['jobServiceRecord']['status_id'] == $statusList['id']) value="{{ $statusList['id'] }}">{{ $statusList['name'] }}</option>
                                                        @endforeach
                                                    </select>
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
