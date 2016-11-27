@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Dashboard</div>

                <div class="panel-body">

                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>

            </div>
            <div class="modal-body">
                <iframe width="560" height="315" src="https://www.youtube.com/embed/Wo6BkRgvYF8?autoplay=1&color=white&modestbranding=1&showinfo=0&loop=0&controls=0&disablekb=0&enablejsapi=1" frameborder="0" allowfullscreen></iframe>
            </div>

        </div>

    </div>
</div>


@endsection
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgXjlMPC7XbnZt6147hygCtb2RUJ5sQig"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/js/home.js" type="text/javascript"></script>
