@extends('layouts.master')
@section('contenu')
    <div class="card-box mb-30">
        <div class="container overflow-hidden"> <br>
            <h2 class="content__title">Click on steps or 'Prev' and 'Next' buttons</h2>
            <!--multisteps-form-->
            <div class="multisteps-form">
                <!--progress bar-->
                <div class="row">
                    <div class="col-12 col-lg-8 ml-auto mr-auto mb-4">
                        <div class="multisteps-form__progress">
                            <button class="multisteps-form__progress-btn js-active" type="button" title="User Info">Client Info</button>
                            <button class="multisteps-form__progress-btn" type="button" title="Address">Addresse</button>
                            <button class="multisteps-form__progress-btn" type="button" title="Comments">Numero phone</button>
                        </div>
                    </div>
                </div>
                <!--form panels-->
                <div class="row">
                    <div class="col-12 col-lg-8 m-auto">
                        <form class="multisteps-form__form" action="{{ route('client.add') }}" method="post">
                        @csrf
                            <!--single form panel-->
                            <div class="multisteps-form__panel shadow p-4 rounded bg-white js-active" data-animation="scaleIn">
                                <h3 class="multisteps-form__title">Client Info</h3>
                                <div class="multisteps-form__content">
                                    <div class="form-row mt-4">
                                        <div class="col-12 col-sm-6">
                                            <input class="multisteps-form__input form-control" type="text" name="noms" placeholder="saisir noms complet" required/>
                                        </div>
                                        <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                            <select class="multisteps-form__select form-control" name="genre" required>
                                                <option selected="selected">selectionnez le genre...</option>
                                                <option value="masculin">Masculin</option>
                                                <option value="feminin">Feminin</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-row mt-4">
                                        <div class="col-12 col-sm-6">
                                            <input class="multisteps-form__input form-control" type="text" name="profession" placeholder="saisir la profession" required/>
                                        </div>
                                        <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                            <select class="multisteps-form__select form-control" name="etatcivil" required>
                                                <option selected="selected">selectionnez le genre...</option>
                                                <option value="Marie(e)">Marie(e)</option>
                                                <option value="Celibataire">Celibataire</option>
                                                <option value="Divorce(e)">Divorce(e)</option>
                                                <option value="Veuf(ve)">Veuf(ve)</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="button-row d-flex mt-4">
                                        <a class="btn btn-primary js-btn-prev" href="{{ route('client.index') }}">Annuler</a>
                                        <button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">Next</button>
                                    </div>
                                </div>
                            </div>
                            <!--single form panel-->
                            <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
                                <h3 class="multisteps-form__title">Your Address</h3>
                                <div class="multisteps-form__content">
                                <div class="form-row mt-4">
                                    <div class="col-12 col-sm-6">
                                        <input class="multisteps-form__input form-control" type="text" name="type_piece" required placeholder="saisir type de la piece"/>
                                    </div>
                                    <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                        <input class="multisteps-form__input form-control" type="text" name="numero_piece" required placeholder="saisir Numero de la piece"/>
                                    </div>
                                </div>
                                <div class="form-row mt-4">
                                    <div class="col-12 col-sm-6">
                                        <input class="multisteps-form__input form-control" type="text" name="adresse" required placeholder="saisir l'adresse"/>
                                    </div>
                                    <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                    <input class="multisteps-form__input form-control" type="email" name="mail" required placeholder="saisir l'adresse Mail"/>
                                    </div>
                                </div>
                                    <div class="button-row d-flex mt-4">
                                        <button class="btn btn-primary js-btn-prev" type="button" title="Prev">Prev</button>
                                        <button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">Next</button>
                                    </div>
                                </div>
                            </div>
                            <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
                                <h3 class="multisteps-form__title">Telephone number</h3>
                                <div class="multisteps-form__content">
                                    <div class="form-row mt-4">
                                        <input class="multisteps-form__input form-control" type="tel" name="contact" required placeholder="Numero telephone"/>
                                    </div>
                                    <div class="form-row mt-4">
                                        <input type="hidden" name="montant_compte" value="0" />
                                    </div>
                                    <div class="button-row d-flex mt-4">
                                        <button class="btn btn-primary js-btn-prev" type="button" title="Prev">Prev</button>
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