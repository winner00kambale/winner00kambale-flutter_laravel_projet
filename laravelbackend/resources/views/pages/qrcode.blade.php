<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carte d'abonnement</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<!-- <body id="homeSection" onload="window.print();">
            <div class="row mt-5 text-center">
                {!! $qrcode !!}
            </div>
</body> -->

<body id="homeSection" onload="window.print();">

        <!-- ========== MAIN CONTENT ========== -->
        <main id="content" role="main">
            <!-- Hero Section -->

            <div class="container">
                <div class="col-md-12">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="col-sm-12">
                                                <br>
                                                <div class="row" style="border: 4px solid black; border-radius: 20px;">

                                                    <div class="col-sm-12" style="text-align: center;">
                                                        <div class="row">
                                                            <div class="col-xs-3 ml-5">
                                                                <img src="{{ asset('src/images/drapeau.png') }}" class="img-responsive img-thumbnail" style="border-color: white; width: 70px; height: 50px; float: left;">
                                                            </div>
                                                            <div class="col-xs-6 pl-2">
                                                                REPUBLIQUE DEMOCRATIQUE DU CONGO <br>
                                                                <span>CARTE D'ABONNEMENT</span>
                                                            </div>
                                                            <div class="col-xs-3">
                                                                <img src=" {{ asset('src/images/drapeau.png') }}" class="img-responsive img-thumbnail" style="border-color: white; width: 70px; height: 50px; float: left;">
                                                            </div>
                                                        </div>
                                                         
                                                    </div>
                                                    <br>
                                                    <div class="row">
                                                        <div class="col-xs-3 ml-5">
                                                        <img src="{{ asset('src/images/win.jpg') }}" style="margin-top: 10px; margin-left: 10px; margin-rigth: 0px;  weigth: 200px; height: 120px;" class="img-responsive img-thumbnail">
                                                        </div>

                                                        <div class="col-xs-9 ml-5">

                                                            <span class="text-muted form-group">
                                                                <strong><i class="fa fa-user"></i>&nbsp;</i>Noms:</strong> {{ $data->noms }}
                                                            </span> <br>

                                                            <span class="text-muted form-group">
                                                                <strong><i class="fa fa-user"></i>&nbsp;Genre:</strong> {{ $data->genre }}
                                                            </span><br>

                                                            <span class="text-muted form-group">
                                                                <strong><i class="fa fa-user">&nbsp;</i>Profession:</strong> {{ $data->profession }}
                                                            </span> <br>

                                                            <span class="text-muted form-group">
                                                                <strong><i class="fa fa-male">&nbsp;</i>Etat civil:</strong> {{ $data->etatcivil }}
                                                            </span><br>

                                                        
                                                            <span class="text-muted form-group">
                                                                <strong><i class="fa fa-phone"></i>&nbsp;Email:</strong> {{ $data->mail }}
                                                            </span><br>

                                                            <span class="text-muted form-group">
                                                                <strong><i class="fa fa-phone"></i>&nbsp;Télephone:</strong> {{ $data->contact }}
                                                            </span><br>

                                                            <span class="text-muted form-group">
                                                                <strong><i class="fa fa-map-marker"></i>&nbsp;Adresse: </strong> {{ $data->adresse }} 
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="col-sm-12">
                                                        <div class="row text-center text-danger">
                                                            les autorités tant civiles que militaires et
                                                            celles de la police nationale sont priées d'apporter leur secours
                                                            au porteur de la présente en cas de nécessité.
                                                        </div>
                                                    </div>
                                                </div>
                                                <br>
                                                <br>
                                                <div class="row" style="border: 4px solid black; border-radius: 20px;">
                                                    <br>
                                                    <div class="row">
                                                        <div class="col-xs-3 ml-5 mt-2">
                                                            {!! $qrcode !!}
                                                        </div>
                                                        <div class="col-xs-9 ml-2">

                                                            <h5 style="text-align: center;">REPUBLIQUE DEMOCRATIQUE DU CONGO</h5>
                                                            <div class="col-xs-4">
                                                            <h4 style="text-align: center; font-weight: bold;">SCAN PAYE SERVICE</h4>
                                                            </div>
                                                            <div class="col-xs-4 text-center">
                                                                <img src="{{ asset('src/images/paye.png') }}" alt="" style="width: 100px; height: 120px; padding: 10px 10px auto; ">
                                                                
                                                                <h2 style="text-align: center; font-weight: bold;">NOTE</h2>
                                                            </div>
                                                            <div class="col-xs-4">
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="col-sm-12">
                                                        <div class="row text-center text-danger"> 
                                                                Si tu ramasse cette carte, svp, rendez-la au poste de Scan-Paye le plus proche.
                                                                La contrefaction de la dite carte est punie de servitude pénale
                                                        </div>
                                                    </div>



                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                    </div>
                </div>
            </div>

        </main>
        <!-- ========== END MAIN CONTENT ========== -->





    </body>



</html>