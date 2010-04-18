Given /^I have a new category with name "([^\"]*)"$/ do |category_name|
  Factory(:category, :name => category_name)
end
