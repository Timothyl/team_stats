$(function(){
  $(".tab3").on("click", function () {
    $.ajax({
      method: "GET",
      url: window.location["pathname"],
      dataType: "json"
    }).done(function(data){
      var summoners = data[0];
      var percent = data[1];
      $("#damages").highcharts({
        chart: {
          type: "bar"
        },
        title: {
          text: "Average Percent Damage Dealt"
        },
        xAxis: {
          categories: summoners
        },
        yAxis: {
          title: {
            text: "Percent"
          }
        },
        series: [{
          name: "Total",
          data: percent
        }]
      });
    });
  });
});
