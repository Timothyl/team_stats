$(function(){
  $(".tab3").on("click", function () {
    $.ajax({
      method: "GET",
      url: window.location["pathname"],
      dataType: "json"
    }).done(function(data){
      var summoners = data[0];
      var physical = data[1];
      var magic = data[2];
      var trueDam = data[3];
      $("#damages").highcharts({
        chart: {
          type: "bar"
        },
        title: {
          text: "Average Percent Damage Dealt to Champions"
        },
        xAxis: {
          categories: summoners
        },
        yAxis: {
          title: {
            text: "Percent"
          }
        },
        plotOptions: {
          series: {
            stacking: "normal"
          }
        },
        colors: ["#A80A0A", "#112291", "gray"],
        series: [{
          name: "Physical",
          data: physical
        },{
          name: "Magic",
          data: magic
        },{
          name: "True",
          data: trueDam
        }]
      });
    });
  });
});
