@extends('layouts.master')
@section('contenu')
    <div class="card-box mb-30">
        <div class="container overflow-hidden"> <br>
            <!-- <h2 class="content__title">Click on steps or 'Prev' and 'Next' buttons</h2> -->
            <!--multisteps-form-->
            <div class="multisteps-form">
                <!--progress bar-->
                <div class="row">
                    <div class="col-12 col-lg-8 ml-auto mr-auto mb-4">
                        <div class="multisteps-form__progress">
                            <button class="multisteps-form__progress-btn js-active" type="button" title="User Info">Chargement du compte</button>
                        </div>
                    </div>
                </div>
                <!--form panels-->
                <div class="row">
                    <div class="col-12 col-lg-8 m-auto">
                        <form class="multisteps-form__form" action="{{ route('compte.store') }}" method="post">
                        @csrf
                            <!--single form panel-->
                            <div class="multisteps-form__panel shadow p-4 rounded bg-white js-active" data-animation="scaleIn">
                                <h3 class="multisteps-form__title">Chargement du Compte</h3>
                                <div class="multisteps-form__content">
                                    <div class="form-row mt-4">
                                        <div class="col-12 col-sm-6">
                                            <input type="hidden" name="client_id" value="{{ $client->id }}">
                                            <label for="">Noms du client</label>
                                            <input class="multisteps-form__input form-control" type="text" value="{{ $client->noms }}" name="noms" readonly required/>
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <label for="">Montant actuel du Compte en Fc</label>
                                            <input class="multisteps-form__input form-control" type="number" value="{{ $client->montant_compte }}" readonly required/>
                                        </div>
                                    </div>
                                    <div class="form-row mt-4">
                                        <div class="col-12 col-sm-6">
                                            <label for="">Montant à chargé en Fc</label>
                                            <input class="multisteps-form__input form-control" name="montant" type="number" required/>
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <label for="">Date du jour</label>
                                            <input class="multisteps-form__input form-control" name="date" type="date" required/>
                                        </div>
                                    </div>
                                    <div class="button-row d-flex mt-4">
                                        <a class="btn btn-primary js-btn-prev" href="{{ route('client.index') }}">Annuler</a>
                                        <button class="btn btn-success ml-auto" type="submit" title="Send">Ajouter</button>
                                    </div>
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