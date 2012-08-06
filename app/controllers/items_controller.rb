class ItemsController < ApplicationController
    
    def index
        @messages = Item.find_in_batches do |items|
            @items = items
        end
    end
end
