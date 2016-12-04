$(document).ready(function(){

    $('#myModal').modal('show');

    document.getElementById("myFrame").src = link;

    console.log(link);

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
    } else {
        console.log("Geolocation is not supported by this browser.");
    }
    createTable();
    showchart();



});


function showchart(){
    //labels for chart
    var labels_for_chart=[];
    var string_labels_for_chart= [];
    string_labels_for_chart =  document.getElementById("categoryList").value.split(',');
    for(var index in string_labels_for_chart)
    {
        labels_for_chart.push(string_labels_for_chart[index]);
    }
    // console.log(labels_for_chart);

    //data for chart
    var data_for_chart=[];
    var string_data_for_chart=[];
    string_data_for_chart = document.getElementById("amountList").value.split(',');
    for(var i = 0; i <string_data_for_chart.length;i++)
    {
        data_for_chart.push(parseInt(string_data_for_chart[i]));
    }
    // console.log(data_for_chart);

    //console.log(data_for_chart);
    var draw_pieChart = document.getElementById("myChart");
    //console.log(draw_pieChart);
    var pieData = {
        labels: labels_for_chart ,
        datasets:[
            {
                data : data_for_chart,
                backgroundColor: [
                    "#3F5D7D",
                    "#279B61",
                    "#008AB8",
                    "#993333",
                    "#A3E496",
                    "#95CAE4",
                    "#CC3333",
                    "#FFCC33",
                    "#FFFF7A",
                    "#CC6699"

                ]

            }
        ]


    };

    var mychart = new Chart(draw_pieChart,{
        type: 'doughnut',
        data:pieData,
        options: {
            title: {
                display: true,
                text: 'Where you spend the most'
            }}


    });



    document.getElementById("myChart").onclick = function(evt)
    {
        var activePoints = mychart.getElementAtEvent(evt);


        //get the internal index of slice in pie chart
        var clickedElementindex = activePoints[0]["_index"];

        //console.log(clickedElementindex);

        var chosen_category = mychart.data.labels[clickedElementindex];

        // console.log("chosen category  is"+ mychart.data.labels[clickedElementindex]);

        //console.log(document.getElementById("merchantCategoryList").value);
        var merchantCategoryList = document.getElementById("merchantCategoryList").value.split('/');
        var array_fav_merchants=[];
        // console.log(label1==label,typeof(label));
        for(var i in merchantCategoryList)
        {
            //  console.log(merchantCategoryList);
            var category= merchantCategoryList[i].split('@')[0].trim();
            if(chosen_category.trim()==category){
                array_fav_merchants.push( merchantCategoryList[i].split('@')[1]);
                // console.log((merchantCategoryList[i].split('@')[1]));

            }
            // console.log((merchantCategoryList[i].split('@')[1]));
        }
        document.getElementById("myMerchant").innerHTML= array_fav_merchants.toString();
        document.getElementById("merchants").innerHTML= "Your favourite merchants for "+ chosen_category;
    }






}

function createTable() {
    var table = document.createElement('table');
    table.setAttribute('class','table table-bordered table table-striped table table-hover');
    table.setAttribute('id','myTable')


// Create an empty <tr> element and add it to the 1st position of the table:
    var row = table.insertRow(0);


// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);

// Add some text to the new cells:
    cell1.innerHTML = "Category";
    cell2.innerHTML = "Expected Date";
    var index_outer=1;
    // console.log(document.getElementById("recurring_category_dates").value);
    for(var i = 0;i< document.getElementById("recurring_category_List").value.split(',').length  ;i++)
    {
        var row = table.insertRow(index_outer);


// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);

        cell1.innerHTML = String(document.getElementById("recurring_category_List").value.split(',')[i]);
        cell2.innerHTML = String(document.getElementById("recurring_category_dates").value.split(',')[i]);


    }

    document.getElementById("myTable").appendChild(table);

}




function toggleVideo(state) {
    // if state == 'hide', hide. Else: show video
    var div = document.getElementById("myModal");
    var iframe = div.getElementsByTagName("iframe")[0].contentWindow;
    div.style.display = state == 'hide' ? 'none' : '';
    func = state == 'hide' ? 'pauseVideo' : 'playVideo';
    iframe.postMessage('{"event":"command","func":"' + func + '","args":""}','*');
}





function showPosition(position) {
    console.log(position.coords.latitude);
    console.log(position.coords.longitude);

    var lat = position.coords.latitude;
    var lng = position.coords.longitude;


    var params = {
        latlng: position.coords.latitude+","+position.coords.longitude,
        sensor: 'true'
    };

    $.get('http://maps.googleapis.com/maps/api/geocode/json', params, function(result) {
        //console.log(result.results[0].address_components.length);
        var address_length = result.results[0].address_components.length;
        var zipcode = result.results[0].address_components[address_length-1].long_name;
        console.log(zipcode);
    });


}

function showError(error) {
    switch (error.code) {
        case error.PERMISSION_DENIED:
            console.log("User denied the request for Geolocation.");
            break;
        case error.POSITION_UNAVAILABLE:
            console.log("Location information is unavailable.");
            break;
        case error.TIMEOUT:
            console.log("The request to get user location timed out.");
            break;
        case error.UNKNOWN_ERROR:
            console.log("An unknown error occurred.");
            break;
    }


}