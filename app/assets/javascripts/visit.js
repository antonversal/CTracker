$(function () {
  var changeVisitAllState = function () {
    var checked_count = $('input.visit:checkbox:checked').length;
    var all_count = $('input.visit:checkbox').length;
    if (checked_count === all_count) {
      $("input.visit-all").prop('checked', true);
    }
    else {
      $("input.visit-all").prop('checked', false);
    }
  };

  var create = function (url, country_ids) {
    $.post(url, {country_ids: country_ids}).success(function () {
      if (typeof Charts.simplePieChart != "undefined")
        Charts.simplePieChart.add_visited(country_ids.length);
      if (typeof Charts.lineChart != "undefined")
        Charts.lineChart.update();
    });
  };

  var destroy = function (url, country_ids) {
    $.ajax({
      url: url,
      type: 'PUT',
      data: {
        country_ids: country_ids
      }
    }).success(function () {
        if (typeof Charts.simplePieChart != "undefined")
          Charts.simplePieChart.remove_visited(country_ids.length);
        if (typeof Charts.lineChart != "undefined")
          Charts.lineChart.update();
      });
  };

  $('table.visit-table').on("change", "input.visit", function () {
    var url = $(this).data("url");
    var country_id = $(this).data("country-id");
    if ($(this).is(':checked')) {
      create(url, [country_id]);
    } else {
      destroy(url, [country_id]);
    }
    changeVisitAllState();
  });

  $('table.visit-table').on("change", "input.visit-all", function () {
    var url = $(this).data("url");
    if ($(this).is(':checked')) {
      var checkboxes = $('input.visit:checkbox:not(:checked)');
      var country_ids = checkboxes.map(function () {
        return $(this).data("country-id")
      }).get();
      checkboxes.prop('checked', true);
      if (country_ids.length > 0) create(url, country_ids);
    } else {
      var checkboxes = $('input.visit:checkbox:checked');
      var country_ids = checkboxes.map(function () {
        return $(this).data("country-id")
      }).get();
      checkboxes.prop('checked', false);
      if (country_ids.length > 0) destroy(url, country_ids);
    }
    changeVisitAllState();
  });
  changeVisitAllState();
});