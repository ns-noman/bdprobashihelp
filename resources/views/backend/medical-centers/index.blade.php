@extends('layouts.admin.master')
@section('content')
    <div class="content-wrapper">
        @include('layouts.admin.content-header')
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <section class="col-lg-12">
                        <div class="card">
                            <div class="card-header bg-primary p-1">
                                <h3 class="card-title">
                                    <a href="{{ route('medical-centers.create') }}"class="btn btn-light shadow rounded m-0"><i
                                            class="fas fa-plus"></i>
                                        <span>Add New</span></i></a>
                                </h3>
                            </div>
                            <div class="card-body">
                                <div class="bootstrap-data-table-panel">
                                    <div class="table-responsive">
                                        <table id="example1" class="table table-striped table-bordered table-centre">
                                            <thead>
                                                <tr>
                                                    <th>SN</th>
                                                    <th>Medical Name</th>
                                                    <th>Medical Code</th>
                                                    <th>Parent Medical</th>
                                                    <th>Address</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($data['medicals'] as $medical)
                                                    <tr>
                                                        <td>{{ $loop->iteration }}</td>
                                                        <td>{{ $medical->name }}</td>
                                                        <td>{{ $medical->code }}</td>
                                                        <td>{{ $medical->parent ? $medical->parent->name : 'N/A' }}</td>
                                                        <td>{{ $medical->address }}</td>
                                                        <td>{{ $medical->status ==1 ? 'Active' : 'Inactive' }}</td>
                                                        <td>
                                                            <div class="d-flex justify-content-center">
                                                                <a href="{{ route('medical-centers.edit' , $medical->id) }}"
                                                                    class="btn btn-info">
                                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                                </a>
                                                                <form class="delete" action="{{ route('medical-centers.destroy', $medical->id) }}" method="post">
                                                                    @csrf
                                                                    @method('DELETE')
                                                                    <button type="submit" class="btn btn-danger">
                                                                        <i class="fa-solid fa-trash"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </div>
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
                            if (result.isConfirmed) {
                                nsAjaxPost(form.attr('action'), form.serialize())
                                    .then(res => {
                                        message(res);
                                        location.reload();
                                    })
                                    .catch(err => {
                                        message(err);
                                    });
                            }
                        });
                    });

    </script>
@endsection