require 'spec_helper'

describe Answer do
    it "is valid with valid attributes" do
        answer = FactoryGirl.build(:answer)
        answer.should be_valid
    end
    
    it "is not valid without text" do
        answer = FactoryGirl.build(:answer, text: nil)
        answer.should_not be_valid
    end
    
    it "belongs to Questions" do
        question = Question.new(contents: "Question")
        answer = Answer.new(text: "Answer")
        answer.question = question
    end
end
