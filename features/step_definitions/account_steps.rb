Given /^I have a new company with name "([^\"]*)"$/ do |account_name|
  Factory(:company, :name => account_name)
end
