// SimplePieChart
// Author: Bradley J. Spaulding
// Created On: 2011-04-25

var simplePieChart;
var SimplePieChart = {};

SimplePieChart.initialize = function(root_element) { return new ViewController(root_element, {
  initialize: function() {
    this.width  = parseInt( this.root.getAttribute('width') );
    this.height = parseInt( this.root.getAttribute('height') );

    this.visited_label = $(this.root).data("visited-label");
    this.not_visited_label = $(this.root).data("not-visited-label");
    this.visited_count = $(this.root).data("visited-count");
    this.not_visited_count = $(this.root).data("not-visited-count");

    this.render();
  },

  render: function() {
    $(this.root).html('');

    var img = document.createElement('img');
    img.setAttribute('width', this.width);
    img.setAttribute('height', this.height);
    img.setAttribute('src', this.image_url());

    this.root.appendChild(img);
  },  

  image_url: function() {
    var url = "http://chart.googleapis.com/chart?"
    url += "cht=p3"
    url += "&chs=" + this.width + 'x' + this.height
    url += "&chco=0000FF"
    
    url += "&chd=t:" + this.values().join();
    url += "&chdl=" + this.labels().join('|');

    return url;
  },

  values: function() {
    return [this.visited_count, this.not_visited_count];
  },

  labels: function() {
    return [this.visited_label, this.not_visited_label];
  },

  add_visited: function(count){
    this.visited_count = this.visited_count + count;
    this.not_visited_count = this.not_visited_count - count;
    this.render();
  },

  remove_visited: function(count){
    this.visited_count = this.visited_count - count;
    this.not_visited_count = this.not_visited_count + count;
    this.render();
  }

})};

$(document).ready(function() {
  $('.simple_pie_chart').each(function() {
    simplePieChart = SimplePieChart.initialize(this);
  });
});