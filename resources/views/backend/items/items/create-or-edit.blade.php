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
                            <form action="{{ isset($data['item']) ? route('items.update',$data['item']->id) : route('items.store'); }}" method="POST" enctype="multipart/form-data">
                                @csrf()
                                @if(isset($data['item']))
                                    @method('put')
                                @endif
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="row">
                                                <input type="hidden" name="is_saleable" value="1">
                                                <div class="form-group col-sm-12 col-md col-lg" hidden>
                                                    <label>Item Type*</label>
                                                    <select name="item_type" id="item_type" class="form-control" required>
                                                        <option value="0" {{ isset($data['item']) ? ($data['item']->item_type == 0 ? 'selected' : null ): null }}>Item</option>
                                                        <option value="1" {{ isset($data['item']) ? ($data['item']->item_type == 1 ? 'selected' : null) : 'selected' }}>Package</option>
                                                    </select>
                                                </div>
                                                @if(!(isset($data['item']) && ($data['item']->item_type == 0)))
                                                    <div class="form-group col-sm-12 col-md col-lg" >
                                                        <div class="form-group">
                                                            <label>Package Items*</label>
                                                            <select class="select2" name="package_item_ids[]" id="package_item_ids" multiple="multiple" data-placeholder="Select Package Items" style="width: 100%;" required>
                                                                @foreach ($data['package_items'] as $package_item)
                                                                    <option value="{{ $package_item->id }}" {{ isset($data['item']) ? (in_array($package_item->id,$data['packageItems']) ? 'selected' : null) : null }}>{{ $package_item->name }}</option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    </div>
                                                @endif
                                                <div class="form-group col-sm-12 col-md col-lg">
                                                    <label>Item Name *</label>
                                                    <input value="{{ isset($data['item']) ? $data['item']->name : null }}" type="text" class="form-control" name="name" placeholder="Item Name" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="form-group col-sm-12 col-md col-lg">
                                                    <label>Purchase Price *</label>
                                                    <input value="{{ isset($data['item']) ? $data['item']->purchase_price : null }}" type="number" class="form-control" name="purchase_price" placeholder="0.00" required>
                                                </div>
                                                <div class="form-group col-sm-12 col-md col-lg" id="price_div_id">
                                                    <label>Sale Price *</label>
                                                    <input value="{{ isset($data['item']) ? $data['item']->sale_price : null }}" type="number" class="form-control" name="sale_price" id="sale_price"  placeholder="0.00" required>
                                                </div>
                                                <div class="form-group col-sm-12 col-md col-lg">
                                                    <label>Status *</label>
                                                    <select name="status" id="status" class="form-control">
                                                        <option {{ isset($data['item']) ? $data['item']->status == 1 ? 'selected' : null : null }} value="1">Active</option>
                                                        <option {{ isset($data['item']) ? $data['item']->status == 0 ? 'selected' : null : null }} value="0">Inactive</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Submit</button>
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
       

    </script>
@endsection
