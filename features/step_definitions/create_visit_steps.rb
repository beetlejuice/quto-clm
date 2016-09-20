When(/^I select "([^"]*)" filter$/) do |filter_name|
  on(ContactsScreen).use_filter(filter_name)
end

When "I create a visit to a contact" do
  on(ContactsScreen).create_visit_to_random_contact
end