@extends('layouts.admin.master')
@section('content')
  <div class="content-wrapper">
      @include('layouts.admin.content-header')
      <section class="content">
          <div class="container-fluid">
              <div class="row">
                  <div class="col-12">
                      <div class="invoice p-3 mb-3" id="my-invoice">
                        <style>
                            #invoice-items th, td {
                                text-align: center;
                                padding: 3px 15px!important;
                                border: 1px solid #ddd;
                            }
                            #invoice-items td:nth-child(3) {
                                text-align: end;
                            }
                            #invoice-summary th, td {
                                /* text-align: center; */
                                padding: 3px 15px!important;
                                border: 1px solid #ddd;
                            }
                            #invoice-summary td:nth-child(2) {
                                text-align: end;
                                font-weight: bold;
                            }
                        </style>
                          <div class="row">
                            <div class="col-12 d-flex justify-content-center">
                                <h1>{{ $data['basicInfo']['title'] }}</h1>
                            </div>
                              <div class="col-12">
                                  <h4>
                                    <img style="height: 50px;width: px;" src="{{ asset('public/uploads/basic-info/' . $data['basicInfo']['logo']) }}" alt="Logo" />
                                    <small class="float-right">Date: {{ date('dS M Y', strtotime($data['master']['sale_date'])) }}</small>
                                  </h4>
                              </div>
                          </div>
                          <div class="row invoice-info">
                                <div class="col-sm-6 invoice-col">
                                    From
                                    <address>
                                        <strong>{{ $data['basicInfo']['title'] }}</strong><br>
                                        {{ $data['basicInfo']['address'] }}<br>
                                        Phone: {{ $data['basicInfo']['phone'] }}<br>
                                        Email: {{ $data['basicInfo']['email'] }}
                                    </address>
                                </div>
                                <div class="col-sm-4 invoice-col">
                                   
                                    To
                                    <address class="text-justify" style="text-align: justify !important;">
                                        <strong>{{ $data['master']['customer_code'] }}/PN:{{ $data['master']['passenger_name'] }}#{{ $data['master']['passenger_passport_no'] }}</strong><br>
                                    </address>
                                    {{ $data['master']['customer_address'] }}<br>
                                    Phone: {{ $data['master']['customer_contact'] }}<br>
                                    Email: {{ $data['master']['customer_email'] }}<br>
                                </div>
                              <div class="col-sm-2 text-right">
                                  {{-- <b>Job #{{ $data['master']['invoice_no'] }}</b><br> --}}
                                  <br>
                                  <p><span><svg class="barcode"></svg></span></p>
                              </div>
                          </div>
                          <div class="row">
                              <div class="col-12 table-responsive">
                                  <table id="invoice-items" class="table table-striped">
                                      <thead>
                                        <tr>
                                            <th>SN</th>
                                            <th>Service Item</th>
                                            <th>Price</th>
                                            <th id="th-action">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($data['details'] as $sd)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>{{ $sd['item_name'] }}</td>
                                                    <td>{{ $data['basicInfo']['currency_symbol'] }} {{ number_format($sd['unit_price'], 2) }}</td>
                                                    <td class="td-action">
                                                        <form class="delete" action="{{ route('sales.delete-sold-items', $sd['id']) }}" method="post">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="btn-action-size btn btn-sm btn-danger" ${row.status != '0' ? "disabled" : null}>
                                                                <i class="fa-solid fa-trash-can"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                  </table>
                              </div>
                          </div>
                          <div class="row">
                              <div class="col-6">
                                  <p class="lead">Payment Methods: {{ $data['master']['payment_method'] }}</p>
                              </div>
                              <div class="col-6">
                                  <div class="table-responsive">
                                      <table id="invoice-summary" class="table">
                                          <tr>
                                              <th style="width:50%">Subtotal:</th>
                                              <td>{{ $data['basicInfo']['currency_symbol'] }} {{ number_format($data['master']['total_price'], 2) }}</td>
                                          </tr>
                                          <tr>
                                              <th>Tax</th>
                                              <td>{{ $data['basicInfo']['currency_symbol'] }} {{ number_format($data['master']['vat_tax'], 2) }}</td>
                                          </tr>
                                          <tr>
                                              <th>Discount:</th>
                                              <td>{{ $data['basicInfo']['currency_symbol'] }} {{ number_format($data['master']['discount'], 2) }}</td>
                                          </tr>
                                          <tr>
                                              <th>Total:</th>
                                              <td>{{ $data['basicInfo']['currency_symbol'] }} {{ number_format($data['master']['total_payable'], 2) }}</td>
                                          </tr>
                                          <tr>
                                              <th>Paid Amount:</th>
                                              <td>{{ $data['basicInfo']['currency_symbol'] }} {{ number_format($data['master']['paid_amount'], 2) }}</td>
                                          </tr>
                                          <tr>
                                              <th>Due Amount:</th>
                                              <td>{{ $data['basicInfo']['currency_symbol'] }} {{ number_format($data['master']['total_payable'] - $data['master']['paid_amount'], 2) }}</td>
                                          </tr>
                                      </table>
                                  </div>
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
  @endsection

@section('script')
    <script>

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
                // if (result.isConfirmed) {
                //     nsAjaxPost(form.attr('action'), form.serialize())
                //         .then(res => {
                //             message(res);
                //             location.reload();
                //         })
                //         .catch(err => {
                //             message(err);
                //         });
                // }
            });
        });


        $(document).ready(function() {
            if ("{{ $data['print'] }}" == 'print') {
              customPrint();
            }
        });
        JsBarcode(".barcode", "{{ $data['master']['invoice_no'] }}", {
            width: 1,
            height: 30,
            displayValue: true
        });
        function customPrint(){
            $('#th-action').attr('hidden', true);
            $('.td-action').attr('hidden', true);

            var printContents = document.getElementById('my-invoice').innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;

            $('#th-action').attr('hidden', false);
            $('.td-action').attr('hidden', false);
        }
    </script>
@endsection
