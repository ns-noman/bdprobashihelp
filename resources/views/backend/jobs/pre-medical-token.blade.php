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
                            </div>
                            <div class="col-4 text-center">
                                <h1>Pre-Medical Token</h1>
                            </div>
                            <div class="col-4 text-right">
                            </div>
                        </div>
                        <div class="row" style="margin-top: 50px!important;">
                            <div class="col-sm-12 invoice-col">
                                <b>Passenger Name: </b>{{ $data['master']['passenger_name'] }}<br>
                                <br>
                                <b>Passport No: </b>{{ $data['master']['passenger_passport_no'] }}<br>
                                <br>
                                <b>Travel To: </b>{{ $data['master']['country_name'] }}<br>
                                <br>
                                <b>Agent Code: </b>HASHOST-{{ $data['master']['agent_code'] }}<br>
                                <br>
                                <b>Medical Name: </b>{{ $data['master']['medical_name'] }}<br>
                                <br>
                                <b>Medical Address: </b>{{ $data['master']['medical_address'] }}<br>
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
