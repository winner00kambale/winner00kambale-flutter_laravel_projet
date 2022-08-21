@extends('layouts.master')
@section('contenu')
        <div class="card-box mb-30">
                    <div class="pd-10">
                    <a href="{{ route('addclient') }}" class="btn btn-primary" style="border-radius: 20px;">new custom</a>
					</div>
					<div class="pd-10">
						<h4 class="h4 text-center">Liste des clients</h4>
					</div>
					<div class="pd-10">
						<table class="data-table table stripe hover nowrap">
							<thead>
								<tr>
									<th class="table-plus datatable-nosort">noms</th>
									<th>genre</th>
									<th>profession</th>
									<th>etat civil</th>
									<th>adress mail</th>
                                    <th>type_piece</th>
                                    <th>numero_piece</th>
                                    <th>montant_compte</th>
                                    <th>telephone</th>
									<th class="datatable-nosort">Action</th>
								</tr>
							</thead>
							<tbody>
            @foreach ($clients as $item)
                <tr>
                    <td>{{ $item->noms }}</td>
                    <td>{{ $item->genre }}</td>
                    <td>{{ $item->profession }}</td>
                    <td>{{ $item->etatcivil }}</td>
                    <td>{{ $item->mail }}</td>
                    <td>{{ $item->type_piece }}</td>
                    <td>{{ $item->numero_piece }}</td>
                    <td>{{ $item->montant_compte }}</td>
                    <td>{{ $item->contact }}</td>
                    <td>
                    <div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="{{ '/client/edit/'.$item->id }}"><i class="dw dw-edit2"></i> Compte</a>
												<a class="dropdown-item" href="#"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="#"><i class="dw dw-delete-3"></i> Delete</a>
											</div>
										</div>
                    </td>
                </tr>
            @endforeach
        </tbody>
						</table>
					</div>
				</div>
				
@endsection
