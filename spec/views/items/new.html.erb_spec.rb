require 'spec_helper'

describe "items/new.html.erb" do
    it "renders the form to create a new item" do
        assign(:item, mock_model(Item).as_new_record)
        render        
        rendered.should have_selector("form",
            method: "post",
            action: items_path
        ) do |form|
            form.should have_selector("input", type: "submit")
        end
    end
    it "renders a text field to type the item text in" do
        assign(:item, mock_model(Item, text: "Item text").as_new_record)
        render
        rendered.should have_selector("form") do |form|
            form.should have_selector("input",
                type: "text",
                name: "item[text]",
                value: "Item text")
        end
    end
end
