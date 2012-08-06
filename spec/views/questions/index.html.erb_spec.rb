require 'spec_helper'

describe "questions/index.html.erb" do
    it "displays the currently available items" do
        assign(:questions, [mock_model(Question, contents:"Question1"), mock_model(Question, contents:"Question2")])
        render
        rendered.should have_content("Question1")
        rendered.should have_content("Question2")
    end
end
