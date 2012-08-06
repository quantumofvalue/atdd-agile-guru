Given /^questions "(.*?)" and "(.*?)" were posted$/ do |question1, question2|
  FactoryGirl.create(:question, contents: question1)
  FactoryGirl.create(:question, contents: question2)
end
