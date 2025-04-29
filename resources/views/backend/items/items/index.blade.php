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
                                    <a href="{{ route('items.create') }}"class="btn btn-light shadow rounded m-0">
                                        <i class="fas fa-plus"></i>
                                        <span>Add New</span></i></a>
                                </h3>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                        <div class="bootstrap-data-table-panel">
                                            <div class="table-responsive">
                                                <table id="dataTable" class="table table-sm table-striped table-bordered table-centre">
                                                    <thead id="thead">
                                                        <tr>
                                                            <th>SN</th>
                                                            <th>Name</th>
                                                            <th>Item Type</th>
                                                            <th>PurchasePrice</th>
                                                            <th>SalesPrice</th>
                                                            <th>Status</th>
                                                            <th>Action</th>        
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tbody">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
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
    $(document).ready(function(){
        var table = $('#dataTable').DataTable({
            initComplete: function () {
                const filterContainer = $('.dataTables_filter').parent();
                const colmd = 4;
                const dataTable_length = $('#dataTable_length').parent().removeClass('col-md-6').addClass(`col-md-${colmd}`);
                const dataTable_filter = $('#dataTable_filter').parent().removeClass('col-md-6').addClass(`col-md-${colmd}`);
                filterContainer.before(`
                    <div class="col-sm-12 col-md-${colmd}">
                        <div class="dataTables_filter" style="display: flex; align-items: center; justify-content: center;">
                            <label style="font-weight: normal; white-space: nowrap; display: flex; align-items: center;margin-bottom: .5rem;">
                                Item Type:
                                    <select name="item_type" id="item_type" class="form-control select2 form-control-sm filter" required>
                                        <option value="">All Items & Packages</option>
                                        <option value="0">Items</option>
                                        <option value="1">Packages</option>
                                    </select>
                            </label>
                        </div>
                    </div>
                `);
                $('.select2').select2();
            },
            processing: true,
            serverSide: true,
            ajax: {
                url: '{{ route("items.list") }}',
                type: 'GET',
                data: function(d) {
                    d.item_type = $('#item_type').val();
                }
            },
            columns: [
                { data: null, orderable: false, searchable: false },
                // { data: 'name', name: 'items.name'},
                { 
                    data: null, 
                    name: 'items.name', 
                    orderable: true, 
                    searchable: false, 
                    render: function(data, type, row, meta) {
                        let text = row.name;
                        let colors = ['info','primary','warning','danger'];
                        if(row.package_items.length) text += '(';
                        row.package_items.forEach((element, index)=> {
                            
                            text += element.item.name + (index + 1 < row.package_items.length ? ', ' : '');
                        });
                        if(row.package_items.length) text += ')';
                        return text;
                    }
                },
                { 
                    data: null, 
                    name: 'items.item_type', 
                    orderable: true, 
                    searchable: false, 
                    render: function(data, type, row, meta) {
                        return `<span class="badge badge-${row.item_type == '1' ? 'primary' : 'info'}">${row.item_type == '1' ? 'Package' : 'Item'}</span>`;
                    }
                },
                { data: 'purchase_price', name: 'items.purchase_price'},
                { data: 'sale_price', name: 'items.sale_price'},
                { 
                    data: null, 
                    name: 'items.status', 
                    orderable: true, 
                    searchable: false, 
                    render: function(data, type, row, meta) {
                        return `<span class="badge badge-${row.status == '1' ? 'success' : 'warning'}">${row.status == '1' ? 'Active' : 'Inactive'}</span>`;
                    }
                },
                { 
                    data: null,
                    orderable: false, 
                    searchable: false, 
                    render: function(data, type, row, meta) {
                        let edit = `{{ route('items.edit', ":id") }}`.replace(':id', row.id);
                        let destroy = `{{ route('items.destroy', ":id") }}`.replace(':id', row.id);

                        return (` <div class="d-flex justify-content-center">
                                        <a href="${edit}"
                                            class="btn btn-sm btn-info">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </a>
                                        <form class="delete" action="${destroy}" method="post" hidden>
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger">
                                                <i class="fa-solid fa-trash-can"></i>
                                            </button>
                                        </form>
                                    </div>
                                `);
                    }
                }
            ],
            rowCallback: function(row, data, index) {
                var pageInfo = table.page.info();
                var serialNumber = pageInfo.start + index + 1;
                $('td:eq(0)', row).html(serialNumber);
            },
            order: [],
            search: { return: false }
        });

        $(document).on('change','.filter',function() {
            table.draw();
        });
        
    });
</script>
@endsection
