class Question < ActiveRecord::Base
  validates_presence_of :contents
  attr_accessible :contents
  has_many :answers, :dependent => :destroy
end
