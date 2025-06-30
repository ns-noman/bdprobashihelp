@extends('layouts.admin.master')
@section('content')
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
                            <form id="payment-form" action="{{ route('customer-payments.store') }}" method="POST"
                                enctype="multipart/form-data">
                                <div class="modal-body">
                                    @csrf()
                                    <div class="row">
                                        <input type="hidden" name="sale_id" id="sale_id">
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Payment Date *</label>
                                            <input value="{{ date('Y-m-d') }}" type="date" class="form-control"
                                                name="date" id="date" required>
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Agents *</label>
                                            <select name="customer_id" id="customer_id" class="form-control" required>
                                                <option value="" selected>Select Agent</option>
                                                @foreach ($data['customers'] as $customer)
                                                    <option value="{{ $customer->id }}">{{ $customer->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Payment Methods *</label>
                                            <select class="form-control" name="account_id" id="account_id" required>
                                                <option selected value=''>Select Payment Methods</option>
                                                @foreach ($data['paymentMethods'] as $paymentMethod)
                                                    <option account-bal="{{ $paymentMethod['balance'] }}" 
                                                        @selected(isset($data['item']) && $data['item']['account_id'] == $paymentMethod['id']) 
                                                        value="{{ $paymentMethod['id'] }}">
                                                        {{ $paymentMethod['name'] .' : '. $paymentMethod['account_no'] }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                            <label>Amount</label>
                                            <input type="number" class="form-control" name="amount" id="amount" placeholder="0.00" required>
                                        </div>
                                        {{-- Advance field (optional) --}}
                                        <input readonly type="hidden" class="form-control" name="paid_in_advanced" id="paid_in_advanced" placeholder="0.00">
                                        <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                            <p><strong>Total Due:</strong> <span id="total-due">0.00</span></p>
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>SN</th>
                                                            <th>Vouchar No</th>
                                                            <th>Date</th>
                                                            <th>Payable</th>
                                                            <th>Paid</th>
                                                            <th>Due</th>
                                                            <th>Pay To Vouchar</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tbody">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                            <label>Note</label>
                                            <input type="text" class="form-control" name="note" id="note" placeholder="Note">
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
        $('#amount').on('keyup blur', function () {
            calculate();
        });

        $('#tbody').on('change', '.pay_it', function () {
            calculate();
        });

        $('#customer_id').on('change', function() {
            $.ajax({
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                url: "{{ route('customer-payments.due.invoice') }}",
                type: 'POST',
                dataType: 'JSON',
                data: {
                    customer_id: $('#customer_id').val()
                },
                success: function(res) {
                    let td = '';
                    let totalDue = 0;

                    res.sales.forEach((val, index) => {
                        const due = val.total_payable - val.paid_amount;
                        totalDue += due;

                        td += `<tr>
                            <td>${index + 1}</td>
                            <td><a href="${`{{ route('sales.invoice', [":id"]) }}`.replace(':id', val.id)}"><b>${val.invoice_no}</b></a></td>
                            <td>${val.date}</td>
                            <td>${res.currency_symbol + ' ' + val.total_payable}</td>
                            <td style="text-align: center;">${res.currency_symbol + ' ' + val.paid_amount}</td>
                            <td style="text-align: center;">${res.currency_symbol + ' ' + due}</td>
                            <td style="text-align: center;">
                                <div class="form-inline">
                                    <input type="hidden" name="sale_id[]" value="${val.id}">
                                    <input readonly class="form-control" due="${due}" type="number" name="paid_amount[]" placeholder="0.00">
                                    <input checked class="form-check-input ml-2 pay_it" type="checkbox" id="pay_id-${index}" name="pay_it[]" value="${val.id}">
                                </div>
                            </td>
                        </tr>`;
                    });

                    $('#tbody').html(td);
                    $('#total-due').text(res.currency_symbol + ' ' + totalDue.toFixed(2));

                    if (!res.sales.length) {
                        $('#tbody').html('<tr><td style="text-align: center;" colspan="7">No Due Vouchar Found!</td></tr>');
                        $('#total-due').text(res.currency_symbol + ' 0.00');
                    }

                    calculate();
                }
            });
        });
    });

    function calculate() {
        let current_payment = parseFloat($('#amount').val()) || 0;
        let total_due = 0;

        // Calculate total due of selected vouchers
        $('input[name="paid_amount[]"]').each(function(index) {
            if ($('#pay_id-' + index).prop('checked')) {
                total_due += parseFloat($(this).attr("due")) || 0;
            }
        });

        // Validate
        if (current_payment > total_due) {
            alert("Amount can't be more than total due. Auto-correcting...");
            current_payment = total_due;
            $('#amount').val(current_payment.toFixed(2));
        }

        // Distribute amount across invoices
        $('input[name="paid_amount[]"]').each(function(index) {
            const due = parseFloat($(this).attr("due")) || 0;
            if ($('#pay_id-' + index).prop('checked')) {
                if (current_payment >= due) {
                    $(this).val(due.toFixed(2));
                    current_payment -= due;
                } else {
                    $(this).val(current_payment.toFixed(2));
                    current_payment = 0;
                }
            } else {
                $(this).val('');
            }
        });

        $('#paid_in_advanced').val(current_payment.toFixed(2));
    }
</script>
@endsection
