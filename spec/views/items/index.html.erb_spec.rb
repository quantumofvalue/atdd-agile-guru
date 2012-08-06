require 'spec_helper'

describe "items/index.html.erb" do
    it "displays the currently available items" do
        assign(:items, [mock_model(Item, text:"Item1"), mock_model(Item, text:"Item2")])
        render
        rendered.should have_content("Item1")
        rendered.should have_content("Item2")
    end
end
