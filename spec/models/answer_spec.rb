require 'spec_helper'

describe Answer do
    it "is valid with valid attributes" do
        item = FactoryGirl.build(:answer)
        item.should be_valid
    end
    
    it "is not valid without text" do
        item = FactoryGirl.build(:answer, text: nil)
        item.should_not be_valid
    end
end
