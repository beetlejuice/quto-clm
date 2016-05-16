When(/^I create organization with following info:$/) do |table|
  # table is a table.hashes.keys # => [:Организация, :Type, :PharmacyType]
  When "I fill CreateOrganization screen with data:", table

end

When(/^I create "([^"]*)" organization with following info:$/) do |org_type, table|
  # table is a table.hashes.keys # => [:Name, :SubType, :PharmacyType]

  on(OrganizationsScreen).start_creating_organization org_type
  on(CreateOrganizationScreen).create_organization_with_data table
  # When "I fill CreateOrganization screen with data:", table
end