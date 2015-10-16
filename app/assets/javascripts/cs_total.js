$(function(){
  $(".tab4, .tab1a").on("click", function () {
    $.ajax({
      method: "GET",
      url: window.location["pathname"],
      dataType: "json"
    }).done(function(data){
      var summoners = data[0];
      var cs = data[5];
      var jungle = data[6];
      $("#cs").highcharts({
        chart: {
          type: "bar"
        },
        title: {
          text: "Average CS",
          style: {"fontSize": "25px"}
        },
        tooltip: {
            headerFormat: "<b>{point.x}</b><br/>",
            pointFormat: "{series.name}: {point.y}<br/>Total: {point.stackTotal}"
        },
        xAxis: {
          categories: summoners
        },
        yAxis: {
          title: {
            text: "Minions"
          }
        },
        plotOptions: {
          series: {
            stacking: "normal"
          }
        },
        series: [{
          name: "Minions",
          data: cs
        },{
          name: "Junlge",
          data: jungle
        }]
      });
    });
  });
});
