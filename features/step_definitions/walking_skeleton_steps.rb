# encoding: utf-8

Given /^items "(.*?)" and "(.*?)" in the database$/ do |item1, item2|
  FactoryGirl.create(:item, text: item1)
  FactoryGirl.create(:item, text: item2)
end

When /^I open "(.*?)" page$/ do |url|
  visit("/#{url}")
end

Then /^I should see "(.*?)" and "(.*?)" listed on the page\.$/ do |item1, item2|
  page.should have_content(item1)
  page.should have_content(item2)
end

Given /^I visit the "(.*?)" page$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I enter "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^click "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the added new item on the page\.$/ do
  pending # express the regexp above with the code you wish you had
end
