$(function(){
  $(".tab2").on("click", function () {
    $.ajax({
      method: "GET",
      url: window.location["pathname"],
      dataType: "json"
    }).done(function(data){
      var summoners = data[0];
      var gold = data[4];
      $("#gold").highcharts({
        chart: {
          type: "column"
        },
        title: {
          text: "Average Amount of Gold Earned",
          style: {"fontSize": "25px"}
        },
        xAxis: {
          categories: summoners
        },
        yAxis: {
          title: {
            text: "Gold"
          }
        },
        plotOptions: {
          series: {
            stacking: "normal"
          }
        },
        colors: ["Gold"],
        series: [{
          name: "Gold",
          data: gold
        }]
      });
    });
  });
});
