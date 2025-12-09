@extends('layouts.admin.master')

@section('title', 'Update Password')

@section('content')
<div class="content-wrapper">

    @include('layouts.admin.content-header')

    <section class="content py-4">
        <div class="container-fluid">
            <div class="row justify-content-center">

                <div class="col-lg-6 col-md-8 col-sm-12">
                    <div class="card card-primary shadow">

                        <div class="card-header text-center">
                            <h3 class="card-title mb-0">Update Password</h3>
                        </div>

                        <form id="form"
                              action="{{ route('admin.password.update', Auth::guard('admin')->user()->id) }}"
                              method="POST">
                            @csrf

                            <div class="card-body">

                                <!-- Current Password -->
                                <div class="form-group mb-3">
                                    <label for="current_password" class="form-label fw-bold">
                                        Current Password
                                    </label>
                                    <input type="password"
                                           class="form-control"
                                           id="current_password"
                                           name="current_password"
                                           placeholder="Enter current password"
                                           autocomplete="current-password"
                                           required>
                                    <small id="check-current-password" class="d-block mt-1"></small>
                                </div>

                                <!-- New Password -->
                                <div class="form-group mb-3">
                                    <label for="new_password" class="form-label fw-bold">
                                        New Password
                                    </label>
                                    <input type="password"
                                           class="form-control"
                                           id="new_password"
                                           name="new_password"
                                           placeholder="Enter new password"
                                           autocomplete="new-password"
                                           required>
                                </div>

                                <!-- Confirm Password -->
                                <div class="form-group mb-3">
                                    <label for="confirm_password" class="form-label fw-bold">
                                        Confirm Password
                                    </label>
                                    <input type="password"
                                           class="form-control"
                                           id="confirm_password"
                                           name="confirm_password"
                                           placeholder="Re-enter new password"
                                           autocomplete="new-password"
                                           required>
                                    <small id="check-confirm-password" class="d-block mt-1"></small>
                                </div>

                            </div>

                            <div class="card-footer text-center">
                                <button id="submit" type="submit" class="btn btn-primary px-5" disabled>
                                    Update Password
                                </button>
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

<!-- CSRF Token (required for AJAX calls) -->
<meta name="csrf-token" content="{{ csrf_token() }}">

<script>
$(document).ready(function () {

    let typingTimer;
    const doneTypingInterval = 400;
    let passwordIsValid = false;

    const csrfToken = $('meta[name="csrf-token"]').attr('content');

    // ======================
    // Check current password
    // ======================
    $('#current_password').on('input', function () {
        clearTimeout(typingTimer);

        const current_password = $(this).val().trim();

        typingTimer = setTimeout(async function () {

            if (!current_password.length) {
                $('#check-current-password').html('');
                passwordIsValid = false;
                $('#submit').prop('disabled', true);
                return;
            }

            const url = "{{ route('admin.password.check') }}";

            try {
                const res = await nsAjaxPost(url, {
                    current_password,
                    _token: csrfToken
                });

                const isValid = res?.status === true || res === true || res === 'true';

                if (isValid) {
                    passwordIsValid = true;
                    $('#check-current-password').html(
                        '<span class="text-success fw-bold">✅ Correct Password</span>'
                    );
                } else {
                    passwordIsValid = false;
                    $('#check-current-password').html(
                        '<span class="text-danger fw-bold">❌ Incorrect Password</span>'
                    );
                }

                toggleSubmitButton();

            } catch (err) {
                console.error(err);
                passwordIsValid = false;
                $('#check-current-password').html(
                    '<span class="text-danger">⚠️ Server error</span>'
                );
                toggleSubmitButton();
            }

        }, doneTypingInterval);
    });

    // ======================
    // Confirm Password Match
    // ======================
    $('#new_password, #confirm_password').on('input', function () {

        const new_password = $('#new_password').val();
        const confirm_password = $('#confirm_password').val();

        if (!confirm_password.length) {
            $('#check-confirm-password').html('');
            toggleSubmitButton();
            return;
        }

        if (new_password === confirm_password) {
            $('#check-confirm-password').html(
                '<span class="text-success fw-bold">✅ Password Matched</span>'
            );
        } else {
            $('#check-confirm-password').html(
                '<span class="text-danger fw-bold">❌ Password Mismatch</span>'
            );
        }

        toggleSubmitButton();
    });

    // ======================
    // Submit form
    // ======================
    $('#form').on('submit', async function (e) {
        e.preventDefault();

        const new_password = $('#new_password').val();
        const confirm_password = $('#confirm_password').val();
        const url = $(this).attr('action');

        if (!passwordIsValid) {
            Swal.fire({
                icon: 'warning',
                title: 'Please enter current password correctly!',
                timer: 1500,
                showConfirmButton: false
            });
            return;
        }

        if (new_password !== confirm_password) {
            Swal.fire({
                icon: 'error',
                title: 'Password Mismatch!',
                timer: 1500,
                showConfirmButton: false
            });
            return;
        }

        $('#submit').prop('disabled', true).text('Updating...');

        try {
            const res = await nsAjaxPost(url, {
                new_password,
                _token: csrfToken
            });

            if (res?.status === true || res === true) {

                Swal.fire({
                    position: "center",
                    icon: "success",
                    title: "Password Updated Successfully!",
                    showConfirmButton: false,
                    timer: 1500
                });

                this.reset();
                passwordIsValid = false;
                $('#check-confirm-password').html('');
                $('#check-current-password').html('');
            }

        } catch (err) {
            console.error(err);
            Swal.fire({
                icon: 'error',
                title: 'Something went wrong!',
                timer: 1500,
                showConfirmButton: false
            });
        } finally {
            $('#submit').prop('disabled', true).text('Update Password');
        }
    });

    function toggleSubmitButton() {
        const new_pass = $('#new_password').val();
        const confirm_pass = $('#confirm_password').val();
        const matched = new_pass && confirm_pass && new_pass === confirm_pass;

        $('#submit').prop('disabled', !(passwordIsValid && matched));
    }

});
</script>
@endsection
