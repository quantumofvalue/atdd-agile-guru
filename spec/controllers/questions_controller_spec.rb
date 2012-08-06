require 'spec_helper'

describe QuestionsController do
    
    describe "GET index" do
        it "lists all questions" do
            questions = [mock_model(Question, contents:"Question1"), mock_model(Question, text:"Question2")]
            Question.stub(:find_in_batches).and_yield(questions)
            get :index
            response.should render_template('index')
            assigns[:questions].should eq(questions)
        end
    end
    
    describe "GET new" do
        it "renders the form to create a new question" do
            question = mock_model(Question, contents:"Question")
            Question.stub(:new).and_return(question)
            get :new
            response.should render_template('new')
            assigns[:question].should eq(question)
        end      
    end
    
    describe "POST create" do
        it "creates a new question" do
            question = mock_model(Question).as_null_object
            Question.should_receive(:new).with("contents" => "Question").and_return(question)
            post :create, :question => { "contents" => "Question" }
        end
        it "saves the newly created question" do
            question = mock_model(Question)
            Question.stub(:new).and_return(question)
            question.should_receive(:save)
            post :create
        end
            
        it "redirects to the Items index" do
            post :create
            response.should redirect_to(:action => "index")
        end
    end
    
end
