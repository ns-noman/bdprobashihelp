@extends('layouts.admin.master')
@section('content')
<div class="content-wrapper">
    @include('layouts.admin.content-header')
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="invoice p-3 mb-3" id="my-invoice">
                        <div class="row mt-3">
                            <div class="col-4">
                                <h4>
                                    <img style="height: 150px;"
                                        src="{{ asset('public/uploads/basic-info/' . $data['basicInfo']['logo']) }}"
                                        alt="Logo" />
                                </h4>
                            </div>
                            <div class="col-4 text-center">
                                <h1>Pre-Medical Token</h1>
                            </div>
                            <div class="col-4 text-right">

                                <address>
                                    {{ $data['basicInfo']['address'] }}<br>
                                    মোবাইল: {{ $data['basicInfo']['phone'] }}<br>
                                    ই-মেইল: {{ $data['basicInfo']['email'] }}
                                </address>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 150px!important;">
                            <div class="col-sm-12 invoice-col">
                                <b>Passenger Name: {{ $data['master']['passenger_name'] }}</b><br>
                                <br>
                                <b>Passport No: {{ $data['master']['passenger_passport_no'] }}</b><br>
                                <br>
                                <b>Travel To: {{ $data['master']['country_name'] }}</b><br>
                                <br>
                                <b>Agent Code: HASHOST-{{ $data['master']['agent_code'] }}</b><br>
                                <br>
                                <b>Medical Name: {{ $data['master']['medical_name'] }}</b><br>
                                <br>
                                <b>Medical Address: {{ $data['master']['medical_address'] }}</b><br>
                                <br>
                            </div>
                        </div>
                        <div class="row no-print">
                            <div class="col-12">
                                <a href="javascript:void(0)" onclick="customPrint()" rel="noopener"
                                    class="btn btn-default">
                                    <i class="fas fa-print"></i> Print</a>
                            </div>
                        </div>
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
        if ("{{ $data['print'] }}" == 'print') {
            customPrint();
        }
    });
    JsBarcode(".barcode", "{{ $data['master']['invoice_no'] }}", {
        width: 1,
        height: 30,
        displayValue: false
    });

    function customPrint() {
        var printContents = document.getElementById('my-invoice').innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }
</script>
@endsection
