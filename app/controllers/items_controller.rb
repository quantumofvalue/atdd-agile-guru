class ItemsController < ApplicationController
    
    def index
        Item.find_in_batches do |items|
            @items = items
        end
    end
    
    def new
        @item = Item.new
    end
    
    def create
        item = Item.new(params[:item])
        item.save
        redirect_to :action => "index"
    end
end
