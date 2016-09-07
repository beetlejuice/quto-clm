Given(/^I am on $screen_name screen$/) do |screen_name|
  step "Then I should see #{screen_name} screen"
end

Given(/I have navigated to $screen_name screen using $route route/) do |screen_name, route|
  navigate_to(screen_name.to_class, :using => route.to_sym)
end

When(/^I open $chapter_name chapter/) do |chapter_name|
  on(HomeScreen).navigate_to_chapter(chapter_name)
end

When(/^I switch to $chapter_name chapter from Tabs/) do |chapter_name|
  pending
end

When(/^I fill $screen_name screen with data:$/) do |screen_name, table|
  pending
end

Then(/^I should see $screen_name screen$/) do |screen_name|
  screen_name_full = screen_name + 'Screen'
  on(screen_name_full.to_class)
end