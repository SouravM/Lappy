<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>@yield('title')</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">
        <link rel="stylesheet" href="/css/master.css" rel="stylesheet" type="text/css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="/js/master.js" type="text/javascript"></script>

        <!-- Styles -->

    </head>
    <body id="parallax">
        <div class="flex-center position-ref full-height">
            {{--
            @if (Route::has('login'))
                <div class="top-right links">
                    <a href="{{ url('/login') }}">Login</a>
                    <a href="{{ url('/register') }}">Register</a>
                </div>
            @endif
            --}}
            <div class="content">
                <div class="title m-b-md">
                    @yield('content')
                </div>

                <a class="waves-effect waves-light btn-large red " href="/login">GET STARTED</a>


            </div>
        </div>
    </body>
</html>
