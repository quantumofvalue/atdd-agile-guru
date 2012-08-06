require 'spec_helper'

describe Item do
    it "is valid with valid attributes" do
        item = FactoryGirl.build(:item)
        item.should be_valid
    end
    
    it "is not valid without text" do
        item = FactoryGirl.build(:item, text: nil)
        item.should_not be_valid
    end
end
