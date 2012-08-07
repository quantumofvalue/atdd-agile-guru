require 'spec_helper'

describe "questions/index.html.erb" do
    it "displays the currently available questions" do
        assign(:questions, [mock_model(Question, contents:"Question1").as_null_object, mock_model(Question, contents:"Question2").as_null_object])
        render
        rendered.should have_content("Question1")
        rendered.should have_content("Question2")
    end
    
    it "displays the answers associated with the question" do
        answers = [mock_model(Answer, text:"Answer1"),mock_model(Answer, text:"Answer2"),mock_model(Answer, text:"Answer3")]
        question = mock_model(Question, contents:"Question", answers:answers)
        
        assign(:questions, [question])
        render
        rendered.should have_content("Question")
        rendered.should have_content("Answer1")
        rendered.should have_content("Answer2")
        rendered.should have_content("Answer3")
    end
    
    it "displays a link to write an answer" do
        assign(:questions, [mock_model(Question, contents:"Question", id:"1").as_null_object])
        render
        # print rendered
        rendered.should have_selector("div.question") do |question_div|
            question_div.should have_selector("a",
                href: new_answer_path(:question_id => "1")) do |linkElement|
                    linkElement.should have_content("Answer")
                end
        end
    end
    
end
