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
          type: "bar"
        },
        title: {
          text: "Average Amount of Gold Earned"
        },
        xAxis: {
          categories: summoners
        },
        yAxis: {
          title: {
            text: "Amount"
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
