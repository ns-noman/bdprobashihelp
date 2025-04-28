<?php

namespace App\Http\Controllers\backend;


use App\Models\Investor;
use App\Models\BikePurchase;
use App\Models\PaymentMethod;
use App\Models\Brand;
use App\Models\BikeModel;
use App\Models\Color;
use App\Models\Buyer;
use App\Models\Bike;
use App\Models\BikeSale;
use App\Models\BikeProfit;
use App\Models\BasicInfo;
use App\Models\Expense;
use App\Models\Sale;
use App\Models\Account;
use App\Models\AccountLedger;
use App\Models\CategoryType;
use App\Models\Item;
use App\Models\StockHistory;


use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;
use Auth;

class ReportController extends Controller
{
    protected $basicInfo;
    public function __construct()
    {
        $this->basicInfo = BasicInfo::select('id','title', 'address', 'phone','logo','email')->first()->toArray();
    }
    public function monthlyBikeSales(Request $request)
    {
        $data['breadcrumb'] = ['title' => 'Monthly Bike Sales Report'];
        if ($request->isMethod("POST")) {
            $data['date'] = $request->date;
            $orderBy = $request->has('order');
            $query = $this->monthlyBikeSalesQuery($data);
            if (!$request->has('order')) $query = $query->orderBy('bike_sales.id', 'desc');
            return DataTables::of($query)->make(true);
        }else {
            $print = $request->input('print');
            if ($print=='true') {
                $data['print'] = $print;
                $data['basicInfo'] = BasicInfo::first()->toArray();
                $data['date'] = $request->date;
                $query = $this->monthlyBikeSalesQuery($data);
                $data['lists'] = $query->get()->toArray();
                return view('backend.reports.monthly-bike-sales.print', compact('data'));
            }else {
                return view('backend.reports.monthly-bike-sales.index', compact('data'));
            }
        }
    }

    public function monthlyBikeSalesQuery($data)
    {
        $select = [
            'bike_sales.id',
            'bike_models.name as model_name',
            'buyers.name as buyer_name',
            'bike_sales.buyer_id',
            'bike_sales.sale_date',
            'bike_sales.sale_price',
            'bike_sales.status',
            'bike_sales.created_by_id',
        ];
        if ($data['date']) [$year, $month] = explode('-', $data['date']);
        $query = BikeSale::join('bike_purchases', 'bike_purchases.id', '=', 'bike_sales.bike_purchase_id')
            ->join('bikes', 'bikes.id', '=', 'bike_purchases.bike_id')
            ->join('bike_models', 'bike_models.id', '=', 'bikes.model_id')
            ->join('buyers', 'buyers.id', '=', 'bike_sales.buyer_id')
            ->where('bike_sales.status', 1);
        if (!empty($year) && !empty($month)) {
            $query = $query->whereYear('bike_sales.sale_date', $year)
                        ->whereMonth('bike_sales.sale_date', $month);
        }
        $query = $query->select($select);
        return $query;
    }
    public function stockReport(Request $request)
    {
        $data['breadcrumb'] = ['title' => 'Item Stock Report'];
        $data['cat_type_id'] = $request->cat_type_id;
        $data['cat_id'] = $request->cat_id;
        if ($request->isMethod("POST")) {
            $orderBy = $request->has('order');
            $query = $this->stockReportQuery($data);
            if (!$request->has('order')) $query = $query->orderBy('items.name', 'asc');
            return DataTables::of($query)->make(true);
        }else {
            $print = $request->input('print');
            if ($print=='true') {
                $data['print'] = $print;
                $data['basicInfo'] = BasicInfo::first()->toArray();
                $query = $this->stockReportQuery($data);
                $data['lists'] = $query->orderBy('items.name', 'asc')->get()->toArray();
                return view('backend.reports.stock-reports.print', compact('data'));
            }else {
                $data['category_types'] = CategoryType::get();
                return view('backend.reports.stock-reports.index', compact('data'));
            }
        }
    }

    public function stockReportQuery($data)
    {
        $select = 
        [
            'items.id',
            'items.name',
            'category_types.title as cat_type_name',
            'categories.title as cat_name',
            'subcategories.title as sub_cat_name',
            'units.title as unit_name',
            'items.purchase_price',
            'items.sale_price',
            'items.vat',
            'items.current_stock',
            'items.image',
            'items.status',
        ];

        $query = Item::join('category_types', 'category_types.id', '=', 'items.cat_type_id')
                        ->join('categories', 'categories.id', '=', 'items.cat_id')
                        ->leftJoin('categories as subcategories', 'subcategories.id', '=', 'items.sub_cat_id')
                        ->join('units', 'units.id', '=', 'items.unit_id')
                        ->where('items.status', 1);
        if($data['cat_type_id']) $query = $query->where('items.cat_type_id', $data['cat_type_id']);
        if($data['cat_id']){
            $cat_id = $data['cat_id'];
            $query = $query->where(function($query) use ($cat_id){
                $query->where('items.cat_id', $cat_id)
                        ->orWhere('items.sub_cat_id', $cat_id);
            });
        }
        $query = $query->select($select);
        return $query;
    }

    public function stockHistory(Request $request)
    {
        $data['breadcrumb'] = ['title' => 'Item Stock History'];
        $data['item_id'] = $request->item_id;
        $data['date'] = $request->date ?? date('Y-m');
        if ($request->isMethod("POST")) {
            $orderBy = $request->has('order');
            $query = $this->stockHistoryQuery($data);
            if (!$request->has('order')) $query = $query->orderBy('stock_histories.id', 'asc');
            return DataTables::of($query)->make(true);
        }else {
            $print = $request->input('print');
            if ($print=='true') {
                $data['print'] = $print;
                $data['basicInfo'] = BasicInfo::first()->toArray();
                $query = $this->stockHistoryQuery($data);
                $data['lists'] = $query->orderBy('stock_histories.id', 'asc')->get()->toArray();
                return view('backend.reports.stock-histories.print', compact('data'));
            }else {
                $data['items'] = Item::with('unit')->where('status',1)->orderBy('name','asc')->get();
                return view('backend.reports.stock-histories.index', compact('data'));
            }
        }
    }

    public function stockHistoryQuery($data)
    {
        $select = 
        [
            'items.name as item_name',
            'units.title as unit_name',
            'stock_histories.item_id',
            'stock_histories.date',
            'stock_histories.particular',
            'stock_histories.stock_in_qty',
            'stock_histories.stock_out_qty',
            'stock_histories.rate',
            'stock_histories.current_stock',
            'stock_histories.created_by_id',
        ];
        if ($data['date']) [$year, $month] = explode('-', $data['date']);
        $query = StockHistory::join('items', 'items.id', '=', 'stock_histories.item_id')
                        ->join('units', 'units.id', '=', 'items.unit_id')
                        ->where('stock_histories.item_id', $data['item_id']);
        if (!empty($year) && !empty($month)) {
            $query = $query->whereYear('stock_histories.date', $year)
                        ->whereMonth('stock_histories.date', $month);
        }
        $query = $query->select($select);
        return $query;
    }

    public function bikeInventory(Request $request)
    {
        $data['breadcrumb'] = ['title' => 'Monthly Bike Sales Report'];
        if ($request->isMethod("POST")) {
            $data['date'] = $request->date ?? date('Y-m');
            $orderBy = $request->has('order');
            $query = $this->bikeInventoryQuery($data);
            if (!$request->has('order')) $query = $query->orderBy('bike_sales.id', 'desc');
            return DataTables::of($query)->make(true);
        }else {
            $print = $request->input('print');
            if ($print=='true') {

                
                $data['basicInfo'] = BasicInfo::first()->toArray();
                $data['date'] = $request->date;

                if ($data['date']) {
                    [$year, $month] = explode('-', $data['date']);
                }
                $data['soldBikesInDate'] = BikePurchase::join('bikes', 'bikes.id', '=', 'bike_purchases.bike_id')
                            ->join('bike_models', 'bike_models.id', '=', 'bikes.model_id')
                            ->leftJoin('bike_sales', 'bike_sales.bike_purchase_id', '=', 'bike_purchases.id')
                            ->whereYear('bike_purchases.purchase_date', $year)
                            ->whereMonth('bike_purchases.purchase_date', $month)
                            ->where('bike_purchases.selling_status', 1)->count();

                $data['unsoldBikes'] = BikePurchase::join('bikes', 'bikes.id', '=', 'bike_purchases.bike_id')
                            ->join('bike_models', 'bike_models.id', '=', 'bikes.model_id')
                            ->leftJoin('bike_sales', 'bike_sales.bike_purchase_id', '=', 'bike_purchases.id')
                            ->where('bike_purchases.selling_status', 0)->count();

                $latestPurchaseSubqury = BikePurchase::selectRaw('max(id) as id')->groupBy('bike_id');
                $data['totalBikes'] = BikePurchase::join('bikes', 'bikes.id', '=', 'bike_purchases.bike_id')
                            ->join('bike_models', 'bike_models.id', '=', 'bikes.model_id')
                            ->leftJoin('bike_sales', 'bike_sales.bike_purchase_id', '=', 'bike_purchases.id')
                            ->whereIn('bike_purchases.id', $latestPurchaseSubqury)
                            ->count();
                $query = $this->bikeInventoryQuery($data);
                $data['lists'] = $query->get()->toArray();
                return view('backend.reports.bike-inventory.print', compact('data'));
            }else {
                return view('backend.reports.bike-inventory.index', compact('data'));
            }
        }
    }

    public function bikeInventoryQuery($data)
    {
        $select = [
            'bike_purchases.id',
            'bike_models.name as model_name',
            'bike_purchases.purchase_price',
            'bike_purchases.servicing_cost',
            'bike_purchases.total_cost',
            'bike_sales.sale_price',
            'bike_purchases.selling_status',
        ];
        
        if ($data['date']) {
            [$year, $month] = explode('-', $data['date']);
        }
        // $latestPurchaseSubqury = BikePurchase::selectRaw('max(id) as id')->groupBy('bike_id');
        $query = BikePurchase::join('bikes', 'bikes.id', '=', 'bike_purchases.bike_id')
            ->join('bike_models', 'bike_models.id', '=', 'bikes.model_id')
            ->leftJoin('bike_sales', 'bike_sales.bike_purchase_id', '=', 'bike_purchases.id');
            // ->whereIn('bike_purchases.id', $latestPurchaseSubqury);
        if (!empty($year) && !empty($month)) {
            $query = $query->whereYear('bike_purchases.purchase_date', $year)
            ->whereMonth('bike_purchases.purchase_date', $month);
        }
        $query = $query->orderBy('bike_purchases.selling_status', 'asc')->select($select);
        return $query;
    }

    public function monthlyExpense(Request $request)
    {
        $data['breadcrumb'] = ['title' => 'Monthly Expense Report'];
        if ($request->isMethod("POST")) {
            $data['date'] = $request->date;
            $orderBy = $request->has('order');
            $query = $this->monthlyExpenseQuery($data);

            if (!$request->has('order')){
                $query = $query->orderBy('expenses.date', 'asc')->orderBy('expense_heads.title', 'asc');
            }

            return DataTables::of($query)->make(true);
        }else {
            $print = $request->input('print');
            if ($print=='true') {
                $data['basicInfo'] = BasicInfo::first()->toArray();
                $data['date'] = $request->date;
                $query = $this->monthlyExpenseQuery($data);
                $data['lists'] = $query->orderBy('expenses.date', 'asc')->orderBy('expense_heads.title', 'asc')->get()->toArray();
                return view('backend.reports.monthly-expenses.print', compact('data'));
            }else {
                return view('backend.reports.monthly-expenses.index', compact('data'));
            }
        }
    }

    public function monthlyExpenseQuery($data)
    {
        $select = [
            'expenses.id',
            'expense_heads.title as expense_name',
            'expenses.date',
            'expense_details.amount',
            'expense_details.note',
        ];
        if ($data['date']) [$year, $month] = explode('-', $data['date']);

        $query = Expense::join('expense_details', 'expense_details.expense_id', '=', 'expenses.id')
            ->join('expense_heads', 'expense_heads.id', '=', 'expense_details.expense_head_id')
            ->where('expenses.status', 1);
        if (!empty($year) && !empty($month)) {
            $query = $query->whereYear('expenses.date', $year)
                    ->whereMonth('expenses.date', $month);
        }
        $query = $query->select($select);
        return $query;
    }

    public function profitLossStatement(Request $request)
    {
        $data['breadcrumb'] = ['title' => 'Profit Loss Statement'];
        if ($request->isMethod("POST")) {
            $data['date'] = $request->date;
            $result = $this->profitLossStatementQuery($data);
            return response()->json($result, 200);
        }else {
            $print = $request->input('print');
            if ($print=='true'){
                $data['basicInfo'] = BasicInfo::first()->toArray();
                $data['date'] = $request->date;
                $data['lists'] = $this->profitLossStatementQuery($data);
                return view('backend.reports.profit-loss-statement.print', compact('data'));
            }else {
                return view('backend.reports.profit-loss-statement.index', compact('data'));
            }
        }
    }

    public function profitLossStatementQuery($data)
    {
        $expenseSelect = [
            'expense_heads.id',
            'expense_heads.title as expense_name',
            DB::raw('SUM(expense_details.amount) as expense_sub_total'),
        ];
        [$year, $month] = explode('-', $data['date']);
        $result['expenses'] = Expense::join('expense_details', 'expense_details.expense_id', '=', 'expenses.id')
            ->join('expense_heads', 'expense_heads.id', '=', 'expense_details.expense_head_id')
            ->where('expenses.status', 1)
            ->whereYear('expenses.date', $year)
            ->whereMonth('expenses.date', $month)
            ->groupBy('expense_details.expense_head_id')
            ->orderBy('expenses.date', 'asc')
            ->orderBy('expense_heads.title', 'asc')
            ->select($expenseSelect)
            ->get(); 
        $result['total_expenses'] = $result['expenses']->sum('expense_sub_total');
        $result['bike_sales'] = BikePurchase::join('bike_sales', 'bike_sales.bike_purchase_id', '=', 'bike_purchases.id')
                ->whereYear('bike_sales.sale_date', $year)
                ->whereMonth('bike_sales.sale_date', $month)
                ->where(['bike_sales.status'=>1])
                ->selectRaw('SUM(bike_sales.sale_price - bike_purchases.total_cost) as profit')
                ->value('profit');
        $result['regular_sales'] = Sale::join('sale_details', 'sale_details.sale_id', '=', 'sales.id')
                ->whereYear('sales.date', $year)
                ->whereMonth('sales.date', $month)
                ->where(['sales.status'=>1,'sale_details.item_type'=>0])
                ->selectRaw('SUM(sale_details.net_profit) as profit')
                ->value('profit');

        $result['service_sales'] = Sale::join('sale_details', 'sale_details.sale_id', '=', 'sales.id')
                ->whereYear('sales.date', $year)
                ->whereMonth('sales.date', $month)
                ->where(['sales.status'=>1,'sale_details.item_type'=>1])
                ->selectRaw('SUM(sale_details.unit_price * sale_details.quantity) as profit')
                ->value('profit');
        $result['total_incomes'] = $result['service_sales'] + $result['bike_sales'] + $result['regular_sales'];
        $result['net_profit'] = $result['total_incomes'] - $result['total_expenses'];
        return $result;
    }

    public function accountLedger(Request $request)
    {
        $data['breadcrumb'] = ['title' => 'Account Ledger'];
        if ($request->isMethod("POST")) {
            $data['date'] = $request->date;
            $data['account_id'] = $request->account_id;
            $query = $this->accountLedgerQuery($data);
            return DataTables::of($query)->make(true);
        }else {
            $print = $request->input('print');
            if ($print=='true') {
                $data['basicInfo'] = BasicInfo::first()->toArray();
                $data['date'] = $request->date;
                $data['account_id'] = $request->account_id;
                $query = $this->accountLedgerQuery($data);
                $data['lists'] = $query->get()->toArray();
                $data['account_info'] = PaymentMethod::join('accounts', 'accounts.payment_method_id', '=','payment_methods.id')
                                        ->where(['payment_methods.status'=>1, 'accounts.status'=>1, 'accounts.id'=> $data['account_id']])
                                        ->select([
                                            'accounts.id',
                                            'payment_methods.name',
                                            'accounts.account_no',
                                        ])
                                        ->first()->toArray();
                return view('backend.reports.account-ledger.print', compact('data'));
            }else {
                $data['paymentMethods'] = $this->paymentMethods();
                return view('backend.reports.account-ledger.index', compact('data'));
            }
        }
    }

    public function accountLedgerQuery($data)
    {
        $select = [
            'account_ledgers.id',
            'account_ledgers.account_id',
            'account_ledgers.debit_amount',
            'account_ledgers.credit_amount',
            'account_ledgers.current_balance',
            'account_ledgers.reference_number',
            'account_ledgers.description',
            'account_ledgers.transaction_date',
        ];
        if ($data['date']) [$year, $month] = explode('-', $data['date']);
        $query = AccountLedger::whereYear('account_ledgers.transaction_date', $year)
                    ->whereMonth('account_ledgers.transaction_date', $month)
                    ->where('account_ledgers.account_id', $data['account_id'])
                    ->orderBy('account_ledgers.id')
                    ->select($select);
        return $query;
    }
    public function accountReport(Request $request)
    {
        $data['breadcrumb'] = ['title' => 'Accounts Reports'];
        if ($request->isMethod("POST")) {
            $query = $this->accountReportQuery($data);
            if(!$request->has('order')) $query = $query->orderBy('id','desc');
            return DataTables::of($query)->make(true);
        }else {
            $print = $request->input('print');
            if ($print=='true') {
                $data['basicInfo'] = BasicInfo::first()->toArray();
                $data['date'] = $request->date;
                $data['account_id'] = $request->account_id;
                $query = $this->accountReportQuery();
                $data['lists'] = $query->get()->toArray();
                return view('backend.reports.accounts-reports.print', compact('data'));
            }else {
                $data['paymentMethods'] = $this->paymentMethods();
                return view('backend.reports.accounts-reports.index', compact('data'));
            }
        }
    }

    public function accountReportQuery()
    {
        return Account::join('payment_methods', 'payment_methods.id', '=', 'accounts.payment_method_id')
                            ->where(['accounts.status'=>1])
                            ->select('accounts.*', 'payment_methods.name as payment_method');
    }
}
