var LineChart = function (root_element) {
  var root = root_element;

  var self = this;

  this.draw = function (data) {
    var options = {
      title: 'My Progress',
      pointSize: 3
    };
    self.chart.draw(data, options);
  };

  this.render = function () {
    $.get('/countries/progress', function (data) {
      var array = [
        ['Date', 'Counts']
      ];
      if (data.length > 0) {
        array = array.concat(data);
      }
      else {
        array = array.concat([
          [0, 0]
        ]);
      }
      var dataTable = google.visualization.arrayToDataTable(array);
      self.draw(dataTable);
    });
  };

  this.constructor = function () {
    self.chart = new google.visualization.LineChart(root);
    self.render();
  }();

};