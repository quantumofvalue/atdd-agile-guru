Feature: Questions
  In order to receive an answer to my question from an Agile Guru
  As an agile enthusiast
  I want to write a question to the system

Scenario: Retrieving all posted questions
    Given questions "Question 1" and "Question 2" were posted
    When I open "questions" page
    Then I should see "Question 1" and "Question 2" listed on the page.

Scenario: Writing new questions
    Given I open "questions/new" page
    When I enter "Question" in "question_contents"
    And click "Save"
    Then I should see the added new item on the page.
