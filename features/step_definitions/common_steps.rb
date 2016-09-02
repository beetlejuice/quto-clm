When(/^I open $chapter chapter/) do |chapter_name|
  on(HomeScreen).navigate_to_chapter(chapter_name)
end

When(/^I switch to $chapter chapter from Tabs/) do |chapter_name|
  pending
end

When(/^I fill $screen screen with data:$/) do |screen, table|
  pending
end

Given(/I have navigated to $screen using $route route/) do |screen, route|
  navigate_to(screen.constantize, :using => route.to_sym)
end