# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  # answer factory with a `belongs_to` association for the question
  factory :answer do
    text "Answer"
    question
  end

  # question factory without associated answers
  factory :question do
    contents "Question"

    # question_with_answers will create answer data after the question has been created
    factory :question_with_answers do
      # answers_count is declared as an ignored attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      ignore do
        answers_count 5
      end

      # the after(:create) yields two values; the question instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the question is associated properly to the answer
      after(:create) do |question, evaluator|
        FactoryGirl.create_list(:answer, evaluator.answers_count, question: question)
      end
    end
  end
end
