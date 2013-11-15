function initLoader() {
  var script = document.createElement("script");
  script.src = "https://www.google.com/jsapi?callback=loadChart";
  script.type = "text/javascript";
  document.getElementsByTagName("head")[0].appendChild(script);
}

function loadChart() {
  google.load("visualization", "1", {packages:["corechart"], callback: createCharts});
}

Charts = {};

function createCharts() {
  var pie_chart_element = $('#simple_pie_chart')[0]
  if (pie_chart_element) Charts.simplePieChart = new SimplePieChart(pie_chart_element);
  var line_chart_element = $('#line_chart')[0]
  if (line_chart_element) Charts.lineChart = new LineChart(line_chart_element);
};

$(document).ready(function () {
  initLoader();
});