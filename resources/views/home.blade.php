@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row" id="dash">
        <div class="col-md-12 col-md-offset-0">
            <div class="panel panel-default">
              

                <div class="panel-body">

                    <h3 class="text-center text-danger">
                        Hi {{$name}} , Your transactions say a lot about you
                    </h3>

                    <ul class="list-group">
                        <li class="list-group-item text-center text-primary">  They tell the categories where you spend the most</li>
                        <li class="list-group-item text-center text-primary">Your favourite merchants, your frequent purchases and a lot more</li>
                    </ul>

                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3" >
                            <canvas   id="myChart" width="140" height="140">

                            </canvas>
                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <h4 class="text-info text-center" id="merchants"></h4>
                                <h4 class="text-center text-info" id="myMerchant"></h4>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-4">

                                <table id="myTable">

                                </table>
                            </div>
                        </div>
                    </div>



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
                <button type="button" class="close" data-dismiss="modal" onclick="toggleVideo('hide')">&times;</button>

            </div>
            <div class="modal-body">
                <iframe id="myFrame" width="567" height="355" src="" frameborder="0" allowfullscreen></iframe>
            </div>

       
</div>

 </div>

        <input type="hidden" id="amountList" value="{{$categoryAmountList}}">
        <input type="hidden" id="categoryList" value="{{$categoryList}}">
        <input type="hidden" id="merchantCategoryList" value="{{$merchantCategoryList}}">
        <input type="hidden" id="recurring_category_List" value="{{$recurring_category_List}}">
        <input type="hidden" id="recurring_category_dates" value="{{$recurring_category_dates}}">


    </div>





@endsection
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgXjlMPC7XbnZt6147hygCtb2RUJ5sQig"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/js/home.js" type="text/javascript"></script>
<script type="text/javascript">
    //get ad lists
    var adlinks_relatable = "{{$ad_sub}}";
    var allads_to_the_category = "{{$ad_all}}";

    allads_to_the_category = allads_to_the_category.replace(/&quot;/g,'"');

    //trim the array

    //console.log(adlinks_relatable);
    //get array of it

    var adlinks_relatable_array = adlinks_relatable.split(",");


    var all = allads_to_the_category.substr(1 ,allads_to_the_category.length-2);
    //console.log(all);
    var all_array = all.split(",");
    for(var ele =0 ; ele<all_array.length;ele++)
    {
        all_array[ele] =all_array[ele].substr(1,all_array[ele].length-2);

    }

    //both in array format now.

    //now we need to iterate in the adlinks_relatable and check if the user has already seen that ad or not.

    var ultimate_result = "";

    var user_id = "{{$user_id}}";

    var ads_he_has_seen = localStorage.getItem(user_id);
    console.log(ads_he_has_seen);

    if(ads_he_has_seen == null||ads_he_has_seen == "")
    {
        ultimate_result = adlinks_relatable_array[Math.floor((Math.random() * adlinks_relatable_array.length))];

    }

    else
    {
        var ads_he_has_seen_array = ads_he_has_seen.split(",");

        console.log(ads_he_has_seen_array);

        var switch_ = 0;

        for(var id=0 ; id<adlinks_relatable_array.length ; id++)
        {

            if(ads_he_has_seen_array.includes(adlinks_relatable_array[id]))
                {

                }
                else {
                    ultimate_result = adlinks_relatable_array[id];
                    switch_ = 1;
                }
        }

        if(!switch_)
        {
            ultimate_result = all_array[Math.floor((Math.random() * all_array.length))];
        }

    }


    link = "https://www.youtube.com/embed/"+ultimate_result+"?autoplay=1&color=white&modestbranding=1&showinfo=0&loop=0&controls=0&disablekb=1&enablejsapi=1";
    //play_the_video


        //store that the user has already seen the video

        var _ = localStorage.getItem(user_id);
        var arr_var=[];

        if(_==null || _=="") {
            arr_var.push(ultimate_result);


        }
        else
        {
            arr_var = _.split(",");
            arr_var.push(ultimate_result);

        }

    console.log("Local storage:"+arr_var.toString());
    localStorage.setItem(user_id,arr_var.toString());






</script>