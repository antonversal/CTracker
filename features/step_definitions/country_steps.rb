Given(/^I am sign in as a user$/) do
  @user = users(:smith)
  visit new_user_session_path
  fill_in "Email", with: @user.email
  fill_in "Password", with: "paSSword123456"
  click_button "Sign in"
end

When(/^I am on the countries page$/) do
  visit countries_path
end

Then(/^I should see list of countries$/) do
  Country.all.each do |c|
    assert(page.has_content?(c.name))
    assert(page.has_content?(c.code))
  end
end

Given /the following countries exist:/ do |countries|
  Country.create!(countries.hashes)
end

Then /^I should see the following table:$/ do |expected_table|
  expected_table.diff!(rows)
end