require 'spec_helper'

describe "answers/new.html.erb" do
    it "renders the form to write an answer to a given question" do
        assign(:question, mock_model(Question, :contents => "Question"))
        assign(:answer, mock_model(Answer, text: "Answer").as_new_record)
        render
        rendered.should have_content("Question")        
        rendered.should have_selector("form",
            method: "post",
            action: answers_path
        ) do |form|
            form.should have_selector("input", type: "submit")
        end
    end
    it "renders a text area for the answer text" do
        assign(:question, mock_model(Question, contents: "Question"))
        assign(:answer, mock_model(Answer, text: "Answer").as_new_record)
        render
        rendered.should have_selector("form") do |form|
            form.should have_selector("textarea",
                name: "answer[text]",
                content: "Answer")
        end
    end
    it "renders a hidden field for the question id" do
        assign(:question, mock_model(Question, contents: "Question", id: "1"))
        assign(:answer, mock_model(Answer, text: "Answer").as_new_record)
        render
        rendered.should have_selector("form") do |form|
            form.should have_selector("input",
                type: "hidden",
                name: "question_id",
                value: "1")
        end
    end
end
