
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Gestion des presences</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"></head>
<body onload="window.print();">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h3 style="text-align: center;">REPUBLIQUE DEMOCRATIQUE DU CONGO</h3>
                        <h5 style="text-align: center;">Egence de Transport <br> en ville de Goma</h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <h2 class="page-header">
                        <i class="fa fa-globe"></i> Trans - Ville <br>
                        <small class="pull-right">BP : 00290/389</small> <br>
                        @foreach ($total as $item)
                        <small class="pull-right">Total : {{ $item->total }} </small>
                        @endforeach
                        </h2>
                    </div>
                    <div class="col-xs-3"></div>
                    
                </div>
                    <hr>
                    <h4 style="text-align: center;">BUREAU DE L'AGENCE</h4>
                        <h4 style="text-align: center;">Rapport Journalier de payement </h4>
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>id</th>
                                    <th>noms</th>
                                    <th>nbr place</th>
                                    <th>montant</th>
                                    <th>voiture</th>
                                    <th>plaque</th>
                                    <th>date jour</th>
                                </tr>
                            </thead>
                            <tbody>
                            @foreach ($data as $item)
                                <tr>
									<td>{{ $item->id }}</td>
                                    <td>{{ $item->noms }}</td>
                                    <td>{{ $item->nombre_place }}</td>
                                    <td>{{ $item->montant }}</td>
                                    <td>{{ $item->marque }}</td>
                                    <td>{{ $item->plaque }}</td>
                                    <td>{{ $item->date_payement }}</td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-2"></div>
                        <div class="col-xs-6">  
                        </div>
                    <div class="col-xs-4">
                        <p class="lead">Fait à Goma,</p>
                        @foreach ($total as $item1)
                        <p>   Date : {{ $item1->date_ }}</p>
                        @endforeach
                    </div>
                </div>
            </div>
</body>
</html>
