class Item < ActiveRecord::Base
    validates_presence_of :text
    attr_accessible :text
end
