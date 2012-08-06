require 'spec_helper'

describe ItemsController do
    describe "GET read" do
        it "provides all available items to the view" do
            items = [mock_model(Item, text:"Item1"), mock_model(Item, text:"Item2")]
            Item.stub(:find_in_batches).and_yield(items)
            get :index
            response.should render_template('index')
            assigns[:messages].should eq(items)
        end
    end
end
