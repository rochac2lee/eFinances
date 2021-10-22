@extends('layouts.app')

@section('content')

@if (!empty($_GET['month']) && !empty($_GET['year']))
@php $month = $_GET['month']; $year = $_GET['year'] @endphp
@else
@php $month = date('m'); $year = date('Y') @endphp
@endif

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            @include('messages')

            <!-- Dashboard -->
            <div class="card">
                <div class="card-header text-center">
                    <strong>{{ translatedMonth($month) }} - {{ $year }}</strong>
                </div>

                <!-- Options -->
                <div class="card-body">
                    <div class="d-flex justify-content-between flex-wrap d-print-none">
                        <div class="mb-3">
                            <button class="btn btn-primary" type="submit" data-toggle="modal" data-target="#storeCategory">Categoria</button>
                            @include('modals.store-category')
                            <button class="btn btn-primary" type="submit" data-toggle="modal" data-target="#storeTransaction">Transação</button>
                            @include('modals.store-transaction')
                        </div>

                        <div class="btn-group mb-3" role="group" aria-label="Basic example">
                            <button class="btn btn-sm btn-secondary" onclick="document.title='relatorio_{{ $month }}_{{ $year }}';window.print()">Imprimir relatório</button>
                        </div>
                    </div>

                    <!-- Dashboard Navigation -->
                    <div class="d-flex justify-content-between flex-wrap d-print-none">
                        <div class="form-group">
                            <select class="form-control" name="year" onchange="location.replace('?month={{ str_pad($month, 2, 0, STR_PAD_LEFT) }}&year='+this.value)">
                                <option value="none" selected disabled hidden>{{ date('Y') }}</option>
                                @for ($y = 2020; $y <= 2030; $y++)
                                <option value="{{ ($y == $year) ? old('y') : $y }}" {{ ($y == $year) ? 'selected' : '' }}>{{ $y }}</option>
                                @endfor
                            </select>
                        </div>

                        <div>
                            <ul class="nav nav-tabs" role="tablist">
                                @for ($m=1; $m <= 12; $m++)
                                <li class="nav-item">
                                    <a href="?month={{ str_pad($m, 2, 0, STR_PAD_LEFT) }}&year={{ $year ?? '' }}" class="nav-link text-primary {{ ($m == $month) ? 'active' : '' }}">{{ substr(translatedMonth($m),0, 3) }}</a>
                                </li>
                                @endfor
                            </ul>
                        </div>
                    </div>

                    <!-- Content -->
                    <div class="tab-content">
                        <div class="tab-pane fade show active">
                            <div class="row mt-2 d-print-none">
                                <div class="col-sm-4 my-2">
                                    <div class="card">
                                        <div class="card-header text-center">
                                            <strong>Balanço mensal</strong>
                                        </div>
                                        <div class="card-body">
                                            <p class="card-text text-success">Receita: {{ formattedMoney($month_one) }}</p>
                                            <p class="card-text text-danger">Despesa: {{ formattedMoney($month_zero) }}</p>
                                        </div>
                                        <div class="card-footer">
                                            <strong class="{{ (($month_one - $month_zero) >= 0) ? 'text-success' : 'text-danger' }}">Total: {{ formattedMoney($month_one - $month_zero) }}</strong>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-4 my-2">
                                    <div class="card">
                                        <div class="card-header text-center">
                                            <strong>Balanço anual</strong>
                                        </div>
                                        <div class="card-body">
                                            <p class="card-text text-success">Receita: {{ formattedMoney($year_one) }}</p>
                                            <p class="card-text text-danger">Despesa: {{ formattedMoney($year_zero) }}</p>
                                        </div>
                                        <div class="card-footer">
                                            <strong class="{{ (($year_one - $year_zero) >= 0) ? 'text-success' : 'text-danger' }}">Total: {{ formattedMoney($year_one - $year_zero) }}</strong>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-4 my-2">
                                    <div class="card">
                                        <div class="card-header text-center">
                                            <strong>Balanço geral</strong>
                                        </div>
                                        <div class="card-body">
                                            <p class="card-text text-success">Receita: {{ formattedMoney($all_one) }}</p>
                                            <p class="card-text text-danger">Despesa: {{ formattedMoney($all_zero) }}</p>
                                        </div>
                                        <div class="card-footer">
                                            <strong class="{{ (($all_one - $all_zero) >= 0) ? 'text-success' : 'text-danger' }}">Total: {{ formattedMoney($all_one - $all_zero) }}</strong>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Content table-->
                            <div class="table-responsive mt-4">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Data</th>
                                            <th scope="col">Transação</th>
                                            <th scope="col">Categoria</th>
                                            <th scope="col" class="text-right">Valor</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse ($transactions as $transaction)
                                        <tr>
                                            <td>{{ date('d/m/Y', strtotime($transaction->date)) }}</td>
                                            <td>
                                                <a href="" target="_blank" data-toggle="modal" data-target="#updateTransaction{{ $transaction->id }}">{{ $transaction->description }}</a>
                                                @include('modals.update-transaction')
                                            </td>
                                            <td>
                                                <a href="" target="_blank" data-toggle="modal" data-target="#updateCategory{{ $transaction->category->id }}">{{ $transaction->category->name }}</a>
                                                @include('modals.update-category')
                                            </td>
                                            <td class="text-right">
                                                <span class="{{ ($transaction->type == 1) ? 'text-success' : 'text-danger' }}">{{ formattedMoney($transaction->value) }}</span>
                                            </td>
                                        </tr>
                                        @empty
                                        <tr>
                                            <td colspan="5" class="text-center">Nenhuma transação encontrada...</td>
                                        </tr>
                                        @endforelse
                                        <tr class="table-secondary {{ (($month_one - $month_zero) >= 0) ? 'text-success' : 'text-danger' }}">
                                            <td colspan="3">
                                                <strong>Total do mês</strong>
                                            </td>
                                            <td colspan="4" class="text-right">
                                                <strong>{{ formattedMoney($month_one - $month_zero) }}</strong>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="text-right">
                        <span>Por <a href="https://www.diegovernan.com.br" target="_blank" class="text-primary">Diego Vernan</a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
