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

Then(/^I should see visited stats$/) do
  trs = all("#visited_countries_chart>table>tr")
  assert(trs[0].has_content?("Visited 1"), "page should have content 'Visited 1'")
  assert(trs[1].has_content?("Not Visited 1"), "page should have content 'Not Visited 1'")
end

When(/^I type first tree letters$/) do
  fill_in "Search", with: "ukr"
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