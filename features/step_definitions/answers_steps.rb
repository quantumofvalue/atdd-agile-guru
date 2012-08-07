Given /^a question with a couple of answers$/ do
  @question = FactoryGirl.create(:question_with_answers)
end

Given /^a question$/ do
  @question = FactoryGirl.create(:question)
end

Then /^I should see this question and the related answers$/ do
  page.should have_selector("p", :text => @question.contents, :count => 1)
  page.should have_selector("p.answer", :text => @question.answers.first.text, :count => @question.answers.length)
end

When /^I click an "(.*?)" link related to the question$/ do |linkText|
  click_link(linkText)
end

Then /^I should see this question and its related only answer$/ do
  page.should have_content(@question.contents)
  page.should have_selector("p.answer", :text => "Answer")
end
