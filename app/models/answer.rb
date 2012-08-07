class Answer < ActiveRecord::Base
    validates_presence_of :text
    attr_accessible :text
    belongs_to :question
end
