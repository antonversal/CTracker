module ApplicationHelper
  def pie_tag(data = {})
    content_tag(:div, nil,
                {id: "simple_pie_chart",
                 data: data})
  end

  def line_tag(url, data)
    content_tag(:div, nil, id: "line_chart", data: {url: url, data: data})
  end
end
