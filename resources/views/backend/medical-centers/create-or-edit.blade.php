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
                            <form action="{{ isset($data['item']) ? route('medical-centers.update',$data['item']->id) : route('medical-centers.store') }}" method="POST" enctype="multipart/form-data">
                                @csrf()
                                @if(isset($data['item']))
                                    @method('put')
                                @endif
                                <div class="card-body">
                                    <div class="row">

                                        {{-- Parent Category --}}
                                        <div class="form-group col-sm-12 col-md-4 col-lg-4">
                                            <label>Parent Center</label>
                                            <select name="parent_id" id="parent_id" class="form-control">
                                                <option value="">Select Parent</option>
                                                @foreach($data['parents'] as $parent)
                                                    <option 
                                                        value="{{ $parent->id }}"
                                                        @isset($data['item'])
                                                            @if($data['item']->parent_id == $parent->id) selected @endif
                                                        @endisset
                                                    >
                                                        {{ $parent->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>

                                        {{-- Name --}}
                                        <div class="form-group col-sm-12 col-md-4 col-lg-4">
                                            <label>Name *</label>
                                            <input 
                                                value="{{ isset($data['item']) ? $data['item']->name : null }}"
                                                type="text"
                                                class="form-control"
                                                name="name"
                                                placeholder="Medical Center Name"
                                                required
                                            >
                                        </div>

                                        {{-- Code --}}
                                        <div class="form-group col-sm-12 col-md-4 col-lg-4">
                                            <label>Code *</label>
                                            <input 
                                                value="{{ isset($data['item']) ? $data['item']->code : null }}"
                                                type="text"
                                                class="form-control"
                                                name="code"
                                                placeholder="Center Code"
                                                required
                                            >
                                        </div>

                                        {{-- Address --}}
                                        <div class="form-group col-sm-12 col-md-8 col-lg-8">
                                            <label>Address</label>
                                            <textarea 
                                                name="address" 
                                                class="form-control" 
                                                rows="1" 
                                                placeholder="Full address"
                                            >{{ isset($data['item']) ? $data['item']->address : null }}</textarea>
                                        </div>
                                        
                                        {{-- Status --}}
                                        <div class="form-group col-sm-12 col-md-4 col-lg-4">
                                            <label>Status *</label>
                                            <select name="status" id="status" class="form-control" required>
                                                <option value="1" 
                                                    {{ (isset($data['item']) && (string)$data['item']->status === '1') ? 'selected' : '' }}>
                                                    Active
                                                </option>

                                                <option value="0" 
                                                    {{ (isset($data['item']) && (string)$data['item']->status === '0') ? 'selected' : '' }}>
                                                    Inactive
                                                </option>
                                            </select>
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
        function profile(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#image_view').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
@endsection