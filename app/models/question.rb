class Question < ActiveRecord::Base
  validates_presence_of :contents
  attr_accessible :contents
end
