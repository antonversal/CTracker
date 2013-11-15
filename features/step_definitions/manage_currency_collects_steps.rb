When(/^I am on the currencies page$/) do
  visit currencies_path
end

Then(/^I should see list of currencies/) do
  Currency.all.each do |c|
    assert(page.has_content?(c.name))
    assert(page.has_content?(c.code))
  end
end

Then(/^I should see collected stats$/) do
  Currency.all.each do |c|
    # probably capybara issue when checked? it returns value or nil
    assert(c.is_collected_by?(@user) == !find("input.visit[value='#{c.country_id}']").checked?.blank?)
  end
end

When(/^I record I collected currency/) do
  currency = currencies(:hryvnia)
  find("input.visit[value='#{currency.country_id}']").set(true)
  wait_for_ajax
end

When(/^I type first tree letters of currency$/) do
  fill_in "Search", with: "hry"
  wait_for_ajax
end

Then(/^I should see filtered currencies/) do
  currency = currencies(:hryvnia)
  assert(page.has_content?(currency.name))
  assert(page.has_content?(currency.code))
end

Then(/^I should not see other currencies/) do
  currency = currencies(:dollar)
  refute(page.has_content?(currency.name))
  refute(page.has_content?(currency.code))
end

When(/^I record all currencies as collected$/) do
  find("input.visit-all").set(true)
  wait_for_ajax
end

When(/^I record all currencies as not collected/) do
  find("input.visit-all").set(false)
  wait_for_ajax
end

Given(/^all currencies are selected$/) do
  UserCountry.create!(user_id: @user.id, country_id: countries(:ukraine).id)
  UserCountry.create!(user_id: @user.id, country_id: countries(:canada).id)
end