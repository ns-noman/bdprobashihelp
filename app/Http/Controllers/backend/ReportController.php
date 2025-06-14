<?php

namespace App\Http\Controllers\backend;

use App\Models\PaymentMethod;
use App\Models\BasicInfo;
use App\Models\Expense;
use App\Models\Sale;
use App\Models\Account;
use App\Models\AccountLedger;
use App\Models\CategoryType;
use App\Models\Item;
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
   
        $result['regular_sales'] = Sale::join('sale_details', 'sale_details.sale_id', '=', 'sales.id')
                ->whereYear('sales.date', $year)
                ->whereMonth('sales.date', $month)
                ->where(['sales.status'=>1])
                ->selectRaw('SUM(sale_details.net_profit) as profit')
                ->value('profit');

        $result['total_incomes'] = $result['regular_sales'];
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
            $query2 = clone $query;
            $accountLedgerSummery = $query2->select(DB::raw('SUM(credit_amount) as total_deposit, SUM(debit_amount) as total_withdrawal'))->first();
            return DataTables::of($query)->with(['accountLedgerSummery'=> $accountLedgerSummery])->make(true);
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
            $query2 = clone $query;
            $totalAllAccountBalance = $query2->sum('balance');
            if(!$request->has('order')) $query = $query->orderBy('id','desc');
            return DataTables::of($query)->with(['totalAllAccountBalance'=> $totalAllAccountBalance])->make(true);
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
                            ->where(['accounts.status'=>1, 'payment_methods.is_virtual'=>0])
                            ->select('accounts.*', 'payment_methods.name as payment_method');
    }
}
