$(function(){
  $(".tab2a").on("click", function () {
    $.ajax({
      method: "GET",
      url: window.location["pathname"],
      dataType: "json"
    }).done(function(data){
      var summoners = data[0];
      var cs_diff = data[7];
      $("#cs_diff").highcharts({
        chart: {
          type: "bar"
        },
        title: {
          text: "Average CS Differential @ 10"
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
          name: "CS",
          data: cs_diff
        }]
      });
    });
  });
});
