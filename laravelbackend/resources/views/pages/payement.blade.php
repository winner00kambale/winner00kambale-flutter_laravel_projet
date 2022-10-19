@extends('layouts.master')
@section('contenu')
    <div class="card-box mb-30">
	<div class="pd-5">
            <form action="{{ route('rapport.show') }}" method="POST" target="_blank">
			@csrf
                <div class="form-group">
                    <div class="row">
                        <div class="col-lg-3">
                            <label for=""> Date debut</label>
                            <input type="date" name="date1" id="date1" class="form-control btn-round">
                        </div>
                        <div class="col-lg-3">
                            <label for=""> Date fin</label>
                            <input type="date" name="date2" id="date2" class="form-control btn-round">
                        </div>
                    </div>
                </div>  
                    <h3 class="box-title">
                        <button type="submit" class="btn btn-primary" name="submit" target="_blank"><i class="fa fa-print"></i></button>
                    </h3>
            </form> 
        </div>
        <div class="container overflow-hidden"> <br>
            <div class="multisteps-form">
                <!--progress bar-->
                <div class="row">
                    <div class="col-12 col-lg-8 ml-auto mr-auto mb-0">
                        <div class="multisteps-form__progress">
                            <button class="multisteps-form__progress-btn js-active" type="button" title="User Info"></button>
                        </div>
                    </div>
                </div>
                <!--form panels-->
                <div class="row">
                    <div class="col-12 col-lg-12 m-auto">
                        <form class="multisteps-form__form">
                            <div class="multisteps-form__panel shadow p-2 rounded bg-white js-active" data-animation="scaleIn">
                                <h3 class="multisteps-form__title">Rapport de Payement</h3>
                                <div class="multisteps-form__content">
                                   
                                <table class="data-table table stripe hover nowrap">
							<thead>
								<tr>
									<th class="table-plus datatable-nosort">id</th>
									<th>noms client</th>
									<th>nbre place</th>
									<th>montant</th>
                                    <th>vehicule marque</th>
                                    <th>vehicule plaque</th>
                                    <th>date payement</th>
									<th class="datatable-nosort">Action</th>
								</tr>
							</thead>
							<tbody>
								@foreach ($payement as $item)
									<tr>
										<td>{{ $item->id }}</td>
										<td>{{ $item->noms }}</td>
										<td>{{ $item->nombre_place }}</td>
										<td>{{ $item->montant }}</td>
                                        <td>{{ $item->marque }}</td>
										<td>{{ $item->plaque }}</td>
										<td>{{ $item->date_payement }}</td>
										<td>
											<div class="dropdown">
												<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
													<i class="dw dw-more"></i>
												</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="{{ '/detail/'.$item->noms }}" target="_blank"><i class="dw dw-print" ></i> Print</a>
												<a class="dropdown-item" href="#"><i class="dw dw-edit2"></i> Edit</a>
												
											</div>
											</div>
										</td>
									</tr>
								@endforeach
        					</tbody>
						</table>
                                    
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <br>
            </div>
        </div>
    </div>
@endsection
