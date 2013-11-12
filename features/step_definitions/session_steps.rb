Given(/^I am sign in as a user$/) do
  @user = users(:smith)
  visit new_user_session_path
  fill_in "Email", with: @user.email
  fill_in "Password", with: "paSSword123456"
  click_button "Sign in"
end