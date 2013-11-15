var LineChart = function (root_element) {
  var root = root_element,
      url = $(root).data("url"),
      elementData = $(root).data("data");

  var self = this;

  this.draw = function (data) {
    var options = {
      title: 'My Progress',
      pointSize: 3
    };
    self.chart.draw(data, options);
  };

  this.getData = function(callback){
    $.get(url, function (data) {callback(data)});
  };

  this.update = function () {
    self.getData(self.createTable);
  };

  this.render = function (data) {
    if (data.length > 0) {
      self.createTable(data);
    }
    else {
     self.getData(self.createTable);
    };
  };

  this.createTable = function (data) {
  //  if given_data
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
  };

  this.constructor = function () {
    self.chart = new google.visualization.LineChart(root);
    self.render(elementData);
  }();

};