module CountriesHelper
  def visited_checkbox_tag(country)
  check_box_tag(:visited,
      country.id,
      country.is_visited_by?(current_user),
          class: "visit",
      data: {url: countries_visited_path, country_id: country.id})
  end
end
