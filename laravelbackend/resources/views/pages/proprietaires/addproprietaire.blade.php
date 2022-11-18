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
                            <button class="multisteps-form__progress-btn js-active" type="button" title="User Info">Ajouter Proprietaires</button>
                        </div>
                    </div>
                </div>
                <!--form panels-->
                <div class="row">
                    <div class="col-12 col-lg-8 m-auto">
                        <form class="multisteps-form__form" action="{{ route('proprietaire.add') }}" method="post">
                        @csrf
                            <!--single form panel-->
                            <div class="multisteps-form__panel shadow p-4 rounded bg-white js-active" data-animation="scaleIn">
                                <h3 class="multisteps-form__title">Proprietaires</h3>
                                <div class="multisteps-form__content">
                                    <div class="form-row mt-4">
                                        <div class="col-12 col-sm-6">
                                            <label for="">Nom du Proprietaire</label>
                                            <input class="multisteps-form__input form-control" type="text" name="nom" required/>
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <label for="">PostNom du Proprietaire</label>
                                            <input class="multisteps-form__input form-control" type="text" name="postnom" required/>
                                        </div>
                                    </div>
                                    <div class="form-row mt-4">
                                        <div class="col-12 col-sm-6">
                                            <label for="">Telephone</label>
                                            <input class="multisteps-form__input form-control" name="telephone" type="text" required/>
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <label for="">Mail</label>
                                            <input class="multisteps-form__input form-control" name="mail" type="mail" required/>
                                        </div>
                                    </div>
                                    <div class="form-row mt-4">
                                        <div class="col-12 col-sm-6">
                                            <label for="">Adresse</label>
                                            <input class="multisteps-form__input form-control" name="adresse" type="text" required/>
                                        </div>
                                    </div>
                                    <div class="button-row d-flex mt-4">
                                        <a class="btn btn-primary js-btn-prev" href="{{ route('proprietaire.index') }}">Annuler</a>
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