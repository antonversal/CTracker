var SimplePieChart = function (root_element) {
  var root = root_element,
      visited_label = $(root).data("visited-label"),
      not_visited_label = $(root).data("not-visited-label"),
      visited_count = $(root).data("visited-count"),
      not_visited_count = $(root).data("not-visited-count");

  var self = this;

    this.render = function() {
      var options = {
        title: 'My Progress',
        is3D: true
      };
      self.chart.draw(this.data(), options);
    };

    this.data = function() {
      return google.visualization.arrayToDataTable([
        ['Status', 'Counts'],
        [visited_label, visited_count],
        [not_visited_label, not_visited_count]
      ]);
    };

    this.add_visited = function (count) {
      visited_count = visited_count + count;
      not_visited_count = not_visited_count - count;
      this.render();
    },

    this.remove_visited = function (count) {
      visited_count = visited_count - count;
      not_visited_count = not_visited_count + count;
      this.render();
    }

  this.constructor = function () {
    self.chart = new google.visualization.PieChart(root);
    self.render();
  }();
};
