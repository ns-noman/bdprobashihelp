@inject('authorization', 'App\Services\AuthorizationService')
@php
   $menus = App\Models\Menu::with('childrenmenu.childrenmenu.childrenmenu.childrenmenu')
                            ->where(['parent_id'=>0,'status'=>1])
                            ->orderBy('srln','asc')
                            ->get()
                            ->toArray();
@endphp
<aside class="main-sidebar sidebar-dark-primary elevation-0 bg-info">
    <a href="{{ route('profile.update-details') }}" class="brand-link">
        <img src="{{ $userImage }}" alt="{{ $basicInfo->title }} Logo" class="brand-image img-circle elevation-3"
            style="opacity: .8" height="30" width="30">
        <span class="brand-text font-weight-dark text-dark">{{ Auth::guard('admin')->user()->name }}</span>
    </a>
    <style>
        .cust-bg-info {
            background-color: #0dcaf0 !important;
            color: white;
        }
        .bg-success-hover:hover {
            background-color: #198754 !important;
        }

    </style>
    <div class="sidebar" style="background-color: #0f0e0e">
    {{-- <div class="sidebar" style="background-color: #000a05"> --}}
      
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                @php
                    if (!function_exists('childrenRouteList')) {
                        function childrenRouteList($childrenMenus, $childrenMenuListArray = []) {
                            foreach ($childrenMenus as $childMenu) {
                                if ($childMenu['route']) {
                                    $childrenMenuListArray[] = $childMenu['route'];
                                }
                                if ($childMenu['create_route']) {
                                    $childrenMenuListArray[] = $childMenu['create_route'];
                                }
                                if (count($childMenu['childrenmenu'])) {
                                    $childrenMenuListArray = array_merge($childrenMenuListArray, childrenRouteList($childMenu['childrenmenu']));
                                }
                            }
                            return $childrenMenuListArray;
                        }
                    }

                    if(!function_exists('displaySidebarMenuList'))
                    {
                        function displaySidebarMenuList($menus,$authorization)
                        {
                            $output = '';
                            foreach ($menus as $menu) {

                                if($menu['is_side_menu'] && $authorization->hasMenuAccess($menu['id'])){


                                    $route = $menu['route'] && Route::has($menu['route']) ? route($menu['route']) : '#';
                                    $createRoute = $menu['create_route'] && Route::has($menu['create_route']) ? route($menu['create_route']) : '#';
                                    

                                    $navicon = $menu['navicon'];
                                    $menuName = $menu['menu_name'];
                                    $hasChildMenu = count($menu['childrenmenu']);
                                    $currentRoute = Route::currentRouteName();
                                    $hasDropDown  = $hasChildMenu ? '<i class="fas fa-angle-left right"></i>' : '';
                                    $btnCreate = $menu['create_route'] ? '<span class="badge cust-bg-info float-right shadow-lg shadow-light bg-success-hover"><i class="fas right fa-solid fa-plus add-new" add-new="' . $createRoute . '"></i></span>' : '';
                                    $rightSideIcon = $menu['route'] ? $btnCreate : $hasDropDown;
                                    $routeList = childrenRouteList($menu['childrenmenu']);
                                    if ($menu['route']) $routeList[] = $menu['route'];
                                    if ($menu['create_route']) $routeList[] = $menu['create_route'];
                                    $active = in_array($currentRoute, $routeList) ? 'active' : '';
                                    $open = in_array($currentRoute, $routeList) ? 'menu-open' : '';

                                    if ($currentRoute=='purchases.create') {
                                        print_r(childrenRouteList($menu['childrenmenu']));
                                    }

                                    $output .= '<li class="nav-item '. $open .'">';
                                    $output .=      '<a href="'. $route .'" class="nav-link '. $active . '">';
                                    $output .=           $navicon;
                                    $output .=          '<p>' . $menuName . $rightSideIcon . '</p>';
                                    $output .=      '</a>';
                                    if($hasChildMenu && in_array(1,array_column($menu['childrenmenu'], 'is_side_menu'))){
                                        $output .=  '<ul class="nav nav-treeview">';
                                        $output .=      displaySidebarMenuList($menu['childrenmenu'],$authorization);
                                        $output .=  '</ul>';
                                    }
                                    $output .= '</li>';


                                }
                            }
                            return $output;
                        }
                    }
                @endphp
                {!! displaySidebarMenuList($menus,$authorization) !!}
            </ul>
        </nav>
    </div>
</aside>
<aside class="control-sidebar control-sidebar-dark"></aside>
{{-- Array ( ) Array ( [0] => basic-infos.edit ) Array ( [0] => roles.index [1] => roles.create [2] => roles.create [3] => roles.edit [4] => roles.destroy [5] => admins.index [6] => admins.create [7] => admins.create [8] => admins.edit [9] => admins.destroy ) Array ( [0] => roles.create [1] => roles.edit [2] => roles.destroy ) Array ( [0] => admins.create [1] => admins.edit [2] => admins.destroy ) Array ( [0] => investors.create [1] => investors.edit ) Array ( [0] => payment-methods.index [1] => payment-methods.create [2] => payment-methods.create [3] => payment-methods.edit [4] => accounts.index [5] => accounts.create [6] => accounts.create [7] => accounts.edit [8] => accounts.fund-transfer ) Array ( [0] => payment-methods.create [1] => payment-methods.edit ) Array ( [0] => accounts.create [1] => accounts.edit [2] => accounts.fund-transfer ) Array ( [0] => investor-transactions.edit [1] => investor-transactions.create [2] => investor-transactions.destroy [3] => investor-transactions.approve ) Array ( [0] => brands.index [1] => brands.create [2] => brands.create [3] => brands.edit [4] => bike-models.index [5] => bike-models.create [6] => assets-statuses.create [7] => bike-models.edit [8] => colors.index [9] => colors.create [10] => colors.create [11] => colors.edit [12] => bike-purchases.index [13] => bike-purchases.create [14] => purchases.create [15] => purchases.edit [16] => purchases.destroy [17] => purchases.approve [18] => bike-sales.index [19] => bike-sales.create [20] => bike-sales.create [21] => bike-sales.edit [22] => bike-sales.destroy [23] => bike-sales.approve [24] => bike-service-records.index [25] => bike-service-records.create [26] => bike-service-records.create [27] => bike-service-records.edit [28] => bike-service-records.view [29] => bike-service-records.destroy [30] => bike-service-records.approve [31] => bike-profits.index [32] => bike-profits.edit [33] => bike-profits.change-status [34] => bike-profits.share-records [35] => bike-profits.share-records.create [36] => bike-profits.share-records.edit [37] => bike-profits.share-records.destroy [38] => bike-profits.share-records.approve ) Array ( [0] => brands.create [1] => brands.edit ) Array ( [0] => assets-statuses.create [1] => bike-models.edit ) Array ( [0] => colors.create [1] => colors.edit ) Array ( [0] => purchases.create [1] => purchases.edit [2] => purchases.destroy [3] => purchases.approve ) Array ( [0] => bike-sales.create [1] => bike-sales.edit [2] => bike-sales.destroy [3] => bike-sales.approve ) Array ( [0] => bike-service-records.create [1] => bike-service-records.edit [2] => bike-service-records.view [3] => bike-service-records.destroy [4] => bike-service-records.approve ) Array ( [0] => bike-profits.edit [1] => bike-profits.change-status [2] => bike-profits.share-records [3] => bike-profits.share-records.create [4] => bike-profits.share-records.edit [5] => bike-profits.share-records.destroy [6] => bike-profits.share-records.approve ) Array ( [0] => bike-service-categories.index [1] => bike-service-categories.create [2] => bike-service-categories.create [3] => bike-service-categories.edit [4] => bike-services.index [5] => bike-services.create [6] => create-route:- bike-services.create [7] => bike-services.edit ) Array ( [0] => bike-service-categories.create [1] => bike-service-categories.edit ) Array ( [0] => create-route:- bike-services.create [1] => bike-services.edit ) Array ( [0] => expense-categories.index [1] => expense-categories.create [2] => expense-categories.create [3] => expense-categories.create [4] => expense-categories.edit [5] => expense-heads.index [6] => expense-heads.create [7] => expense-heads.create [8] => expense-heads.edit [9] => expenses.index [10] => expenses.create [11] => expenses.create [12] => expenses.edit [13] => expenses.destroy [14] => expenses.approve [15] => expenses.view ) Array ( [0] => expense-categories.create [1] => expense-categories.create [2] => expense-categories.edit ) Array ( [0] => expense-heads.create [1] => expense-heads.edit ) Array ( [0] => expenses.create [1] => expenses.edit [2] => expenses.destroy [3] => expenses.approve [4] => expenses.view ) Array ( [0] => categories.index [1] => categories.create [2] => sub-categories.index [3] => sub-categories.create [4] => items.index [5] => items.create [6] => suppliers.index [7] => suppliers.create [8] => purchases.index [9] => purchases.create [10] => payments.index [11] => payments.create ) Array ( [0] => categories.index [1] => categories.create [2] => sub-categories.index [3] => sub-categories.create [4] => items.index [5] => items.create [6] => suppliers.index [7] => suppliers.create ) Array ( ) Array ( ) Array ( ) Array ( ) Array ( ) Array ( ) --}}
