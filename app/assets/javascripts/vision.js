$(function(){
  $(".tab5").on("click", function () {
    $.ajax({
      method: "GET",
      url: window.location["pathname"],
      dataType: "json"
    }).done(function(data){
      var summoners = data[0];
      var wards_placed = data[8];
      var wards_destroyed = data[9];
      $("#vision").highcharts({
        chart: {
          type: "bar"
        },
        title: {
          text: "Average Number of Wards Placed/Destroyed",
          style: {"fontSize": "25px"}
        },
        xAxis: {
          categories: summoners
        },
        yAxis: {
          title: {
            text: "Wards"
          }
        },
        colors: ["green","pink"],
        series: [{
          name: "Placed",
          data: wards_placed
        },{
          name: "Destroyed",
          data: wards_destroyed
        }]
      });
    });
  });
});
