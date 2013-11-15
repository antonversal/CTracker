When(/^I am on the countries page$/) do
  visit countries_path
end

Then(/^I should see list of countries$/) do
  Country.all.each do |c|
    assert(page.has_content?(c.name))
    assert(page.has_content?(c.code))
  end
end

Then(/^I should see visited stats$/) do
  Country.all.each do |c|
    # probably capybara issue when checked? it returns value or nil
    assert(c.is_visited_by?(@user) == !find("input.visit[value='#{c.id}']").checked?.blank?)
  end
end

When(/^I type first tree letters$/) do
  fill_in "Search", with: "ukr"
  wait_for_ajax
end

Then(/^I should see filtered country$/) do
  country = countries(:ukraine)
  assert(page.has_content?(country.name))
  assert(page.has_content?(country.code))
end

Then(/^I should not see other countries$/) do
  country = countries(:usa)
  refute(page.has_content?(country.name))
  refute(page.has_content?(country.code))
end

When(/^I record I visited country$/) do
  country = countries(:ukraine)
  find("input.visit[value='#{country.id}']").set(true)
  wait_for_ajax
end

Then(/^visited state should be changed$/) do
  country = countries(:ukraine)
  assert(UserCountry.exists?(user_id: @user.id, country_id: country.id))
end

Then(/^chart should change percentage/) do
  pending
end

When(/^I record all countries as visited$/) do
  find("input.visit-all").set(true)
  wait_for_ajax
end

Then(/^visited state of all countries should be changed to visited$/) do
  assert(UserCountry.exists?(user_id: @user.id, country_id: countries(:ukraine).id))
  assert(UserCountry.exists?(user_id: @user.id, country_id: countries(:usa).id))
end


When(/^I record all countries as not visited$/) do
  find("input.visit-all").set(false)
  wait_for_ajax
end

Then(/^visited state of all countries should be changed to not visited$/) do
  refute(UserCountry.exists?(user_id: @user.id, country_id: countries(:ukraine).id))
  refute(UserCountry.exists?(user_id: @user.id, country_id: countries(:usa).id))
end

Given(/^all countries are selected$/) do
  UserCountry.create!(user_id: @user.id, country_id: countries(:ukraine).id)
  UserCountry.create!(user_id: @user.id, country_id: countries(:canada).id)
end

Then(/^visited state of filtered countries should be changed to visited$/) do
  assert(UserCountry.exists?(user_id: @user.id, country_id: countries(:ukraine).id))
end

Then(/^visited state of not filtered countries should not be changed$/) do
  refute(UserCountry.exists?(user_id: @user.id, country_id: countries(:canada).id))
end