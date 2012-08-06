require 'spec_helper'

describe Question do
    it "is valid with valid attributes" do
        question = FactoryGirl.build(:question)
        question.should be_valid
    end
    
    it "is not valid without text" do
        question = FactoryGirl.build(:question, contents: nil)
        question.should_not be_valid
    end
end