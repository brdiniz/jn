Given /^I have a new company with name "([^\"]*)"$/ do |account_name|
  a = Factory.build(:company, :name => account_name)
  a.save
  puts a.errors.full_messages
end
