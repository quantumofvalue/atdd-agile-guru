@answers
Feature: Answers
  In order to help an agile enthusiast with the problem
  As an experienced agile practitioner
  I want to add an answer to a question

Scenario: Listing answers to a given question
  Given a question with a couple of answers
  When I open "questions" page
  Then I should see this question and the related answers

Scenario: Adding an answer to a question
    Given a question
    When I open "questions" page
    And I click an "Answer" link related to the question
    And I enter "Answer" in "answer_text"
    And click "Add"
    Then I should see this question and its related only answer

