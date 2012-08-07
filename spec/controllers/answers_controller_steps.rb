require 'spec_helper'

describe AnswersController do
    
    describe "GET new" do
        it "renders the form to write an answer to a question" do
            Question.stub(:find)
            get :new
            response.should render_template('new')
        end
        it "sets the question object to be available in the view" do            
            question = mock_model(Question, contents:"Question")
            Question.should_receive(:find).with(12).and_return(question)
            get(:new,{'question_id'=>'12'})
            assigns[:question].should eq(question)
        end
        it "sets the answer object to a new record" do
            Question.stub(:find)
            answer = mock_model(Answer, contents:"Answer")
            Answer.stub(:new).and_return(answer)
            get :new
            assigns[:answer].should eq(answer)
        end
    end
    
    describe "POST create" do
        it "creates a new answer" do
            answer = mock_model(Answer).as_null_object
            question = mock_model(Question, id: "1")
            answer.should_receive(:question=).with(question)
            Answer.should_receive(:new).with("text" => "Answer").and_return(answer)
            Question.should_receive(:find).with(1).and_return(question)
            post(:create, {:answer => { "text" => "Answer"}, :question_id => "1"})
        end
        it "saves the newly created answer" do
            answer = mock_model(Answer)
            Answer.stub(:new).and_return(answer)
            answer.should_receive(:save)
            post :create
        end
            
        it "redirects to the Questions index" do
            post :create
            response.should redirect_to(:controller => "questions", :action => "index")
        end
    end
    
end
