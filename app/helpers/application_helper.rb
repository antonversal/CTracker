module ApplicationHelper
  def pie_tag(data = {})
    content_tag(:div, nil,
                {id: "visited_countries_chart",
                 class: "simple_pie_chart",
                 width: '300px',
                 height: '100px',
                 data: data})
  end
end
