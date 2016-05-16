def user(profile)
  users[profile]
end

Given(/^I am on $screen screen$/) do |screen_name|
  screen_name_full = screen_name + 'Screen'
  on(screen_name_full.to_class).active?.should be true
end

When(/^I login with $profile_name user/) do |profile_name|
  on(LoginScreen).perform_login_with user(profile_name)
end

And(/^I allow authorization access$/) do
  on(AuthorizationRequestScreen).allow_access
end