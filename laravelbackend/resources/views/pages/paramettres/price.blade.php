@extends('layouts.master')
@section('contenu')
    <div class="card-box mb-30">
        <div class="container overflow-hidden"> <br>
            <div class="multisteps-form">
                <!--progress bar-->
                <div class="row">
                    <div class="col-12 col-lg-8 ml-auto mr-auto mb-4">
                        <div class="multisteps-form__progress">
                            <button class="multisteps-form__progress-btn js-active" type="button" title="User Info">Mise à du prix de place</button>
                        </div>
                    </div>
                </div>
                <!--form panels-->
                <div class="row">
                    <div class="col-12 col-lg-6 m-auto">
                        <form class="multisteps-form__form" action="{{ route('Price.price') }}" method="post">
                        @csrf
                            <!--single form panel-->
                            <div class="multisteps-form__panel shadow p-4 rounded bg-white js-active" data-animation="scaleIn">
                                <h3 class="multisteps-form__title">Prix d'une place</h3>
                                <div class="multisteps-form__content">
                                    <div class="form-row mt-4">
                                        <div class="col-12 col-sm-6">
                                            <label for="">Montant (Fc)</label>
                                            <input class="multisteps-form__input form-control" type="number" name="prix" required/>
                                        </div>
                                        <div class="col-12 col-sm-6 text-center">
                                        <label for="">Prix</label> <br>
                                            @foreach ($prix as $item)
                                            <p> <strong style="color:red;">{{ $item->prix }} Fc</strong></p>
                                            @endforeach
                                        </div>
                                    </div>
                                    <div class="button-row d-flex mt-4">
                                        <button class="btn btn-success " type="submit" title="Send">Mis à jour</button>
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