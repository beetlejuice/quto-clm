def user(profile)
  users[profile]
end

When(/^I login with $profile_name user/) do |profile_name|
  on(LoginScreen).perform_login_with user(profile_name)
end

And(/^I allow authorization access$/) do
  on(AuthorizationRequestScreen).allow_access
end