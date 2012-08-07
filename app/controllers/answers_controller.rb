class AnswersController < ApplicationController
    
    def new
        @question = Question.find(params[:question_id].to_i)
        @answer = Answer.new
    end
    
    def create
        answer = Answer.new(params[:answer])
        answer.question = Question.find(params[:question_id].to_i)
        answer.save
        redirect_to :controller => "questions", :action => "index"
    end
end
