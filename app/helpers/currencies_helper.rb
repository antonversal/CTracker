module CurrenciesHelper
  def collected_checkbox_tag(currency)
    check_box_tag(:visited,
                  currency.country_id,
                  currency.is_collected_by?(current_user),
                  class: "visit",
                  data: {url: countries_visited_path, country_id: currency.country_id})
  end
end
