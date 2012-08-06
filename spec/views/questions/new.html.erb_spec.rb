require 'spec_helper'

describe "questions/new.html.erb" do
    it "renders the form to create a new question" do
        assign(:question, mock_model(Question).as_new_record)
        render        
        rendered.should have_selector("form",
            method: "post",
            action: questions_path
        ) do |form|
            form.should have_selector("input", type: "submit")
        end
    end
    it "renders a text area for the question contents" do
        assign(:question, mock_model(Question, contents: "Question Contents").as_new_record)
        render
        rendered.should have_selector("form") do |form|
            form.should have_selector("textarea",
                name: "question[contents]",
                content: "Question Contents")
        end
    end
end