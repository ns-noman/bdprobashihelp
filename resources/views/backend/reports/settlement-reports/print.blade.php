@extends('layouts.admin.master')
@section('content')
  <div class="content-wrapper">
      @include('layouts.admin.content-header')
      <section class="content">
          <div class="container-fluid">
              <div class="row">
                  <div class="col-12">
                      <div class="invoice p-3 mb-3" id="my-invoice">
                          <div class="row">
                              <div class="col-12">
                                  <h4>
                                      <small class="float-right">Print Date: {{ date('dS M Y', strtotime(Date('Y-m-d'))) }}</small>
                                  </h4>
                              </div>
                          </div>
                          <div class="row invoice-info" style="margin-top: 100px;">
                              <div class="col-sm-4 invoice-col">
                                  <strong>Report Name: </strong>Settlement Report<br>
                                  @if($data['fromDate'] && $data['toDate'])
                                    <strong>Period: </strong>{{ \Carbon\Carbon::parse($data['fromDate'])->format('d F Y') }} to
                                    {{ \Carbon\Carbon::parse($data['toDate'])->format('d F Y') }}
                                  @endif
                              </div>
                              <div class="col-sm-4 invoice-col">
                              </div>
                              <div class="col-sm-4 invoice-col">
                              </div>
                          </div>
                          <div class="row">
                              <div class="col-12 table-responsive">
                                  <table class="table table-striped text-center">
                                      <thead>
                                            <tr>
                                                <th>SN</th>
                                                {{-- <th>Agent Name</th> --}}
                                                <th>Agent Code</th>
                                                <th>Passport No</th>
                                                <th>Local Host</th>
                                                {{-- <th>Local Host Bar</th> --}}
                                                <th>Amount</th>
                                            </tr>  
                                        </thead>
                                        <tbody>
                                            @foreach ($data['lists'] as $list)
                                                <tr style="text-align: center">
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>{{ $list['agent_code'] }}</td>
                                                    {{-- <td>{{ $list['agent_name'] }}</td> --}}
                                                    <td>{{ $list['passenger_passport_no'] }}</td>
                                                    {{-- <td>{{ $list['localhost_no'] }}</td> --}}
                                                    <td><svg class="barcode" data-barcode="{{ $list['localhost_no'] ?? 'N/A' }}"></svg></td>
                                                    <td></td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                  </table>
                              </div>
                          </div>
                          <div class="row">
                              <div class="col-6">
                              </div>
                              <div class="col-6">
                              </div>
                          </div>
                          <div class="row no-print">
                              <div class="col-12">
                                  <a href="javascript:void(0)" onclick="customPrint()" rel="noopener" class="btn btn-default">
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
<script src="https://cdn.jsdelivr.net/npm/jsbarcode@3.11.6/dist/barcodes/JsBarcode.code128.min.js"></script>
    <script>
        $(document).ready(function() {
            $(document).ready(function () {
                $('.barcode').each(function () {
                    const value = $(this).data('barcode') || 'N/A';
                    JsBarcode(this, value, {
                        // format: "CODE128",
                        // width: 1,
                        // height: 30,
                        // displayValue: false
                        width: 1,
                        height: 20,
                        displayValue: true
                    });
                });
                customPrint();
            });

            if (true) {
              customPrint();
            }
        });
        function customPrint(){
          var printContents = document.getElementById('my-invoice').innerHTML;
          var originalContents = document.body.innerHTML;
          document.body.innerHTML = printContents;
          window.print();
          document.body.innerHTML = originalContents;
        }
    </script>
@endsection
