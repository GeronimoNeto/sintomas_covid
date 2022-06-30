@extends('layout.app')
@section('title','Login')

@section('content')
    <div class="modal modal-signin position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalSignin"  style="background-color:transparent !important;">
        <div class="modal-dialog" role="document">
            <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h2 class="fw-bold mb-0">Login do Enfermeiro</h2>
            </div>
            <div class="modal-body p-5 pt-0">
                <form class="" method="GET" id="login">
                    
                    <div class="form-floating mb-3">
                        <input name="email" type="email" class="form-control rounded-3" id="floatingInput" placeholder="name@example.com" required>
                        <label for="floatingInput">Endereço de Email</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input name="pass" type="password" class="form-control rounded-3" id="floatingPassword" placeholder="Password" required>
                        <label for="floatingPassword">Senha correspondente</label>
                    </div>
                    <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit" name="submit" value="login">Entrar</button>
                </form>
            </div>
            </div>
        </div>
    </div>
@endsection