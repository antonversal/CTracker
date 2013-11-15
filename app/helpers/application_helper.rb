module ApplicationHelper
  def pie_tag(data = {})
    content_tag(:div, nil,
                {id: "simple_pie_chart",
                 data: data})
  end
end
