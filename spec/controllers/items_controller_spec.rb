require 'spec_helper'

describe ItemsController do
    
    describe "GET index" do
        it "provides all available items to the view" do
            items = [mock_model(Item, text:"Item1"), mock_model(Item, text:"Item2")]
            Item.stub(:find_in_batches).and_yield(items)
            get :index
            response.should render_template('index')
            assigns[:items].should eq(items)
        end
    end
    
    describe "GET new" do
        it "renders the form to create a new item" do
            item = mock_model(Item, text:"Item")
            Item.stub(:new).and_return(item)
            get :new
            response.should render_template('new')
            assigns[:item].should eq(item)
        end      
    end
    
    describe "POST create" do
        it "creates a new item" do
            item = mock_model(Item).as_null_object
            Item.should_receive(:new).with("text" => "Test Item").and_return(item)
            post :create, :item => { "text" => "Test Item" }
        end
        it "saves the newly created item" do
            item = mock_model(Item)
            Item.stub(:new).and_return(item)
            item.should_receive(:save)
            post :create
        end
            
        it "redirects to the Items index" do
            post :create
            response.should redirect_to(:action => "index")
        end
    end
end
