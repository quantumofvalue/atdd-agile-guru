class QuestionsController < ApplicationController
    
    def index
        Question.find_in_batches do |questions|
            @questions = questions
        end
    end
    
    def new
        @question = Question.new
    end
    
    def create
        question = Question.new(params[:question])
        question.save
        redirect_to :action => "index"
    end
end
