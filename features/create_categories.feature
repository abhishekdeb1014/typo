Feature: Create and Edit Categories
    As a blog administrator
    In order to organize blog articles
    I want to be able to create new categories and assign articles to them

    Background:
        Given the blog is set up
        And I am logged into the admin panel
        When I follow "Categories"

    Scenario: Link should not be broken
        Then I should see "Categories"
        And I should see "Permalink"
        And I should see "General"
        And I should see "Name"
        And I should see "Keywords"

    Scenario: It should be possible to create new categories
        When I fill in "Name" with "Cricket"
        When I fill in "Keywords" with "Sport, ICC"
        When I fill in "Permalink" with "CC"
        When I fill in "Description" with "If cricket is religion, then Sachin is god & Dada is godfather"
        And I press "Save"
        Then I should see "Cricket"
        And I should see "no articles"
        And I should see "Sport, ICC"
        And I should see "CC"
        And I should see "If cricket is religion, then Sachin is god & Dada is godfather"

    Scenario: It should be possible to edit existing categories
        When I follow "General"
        Then I fill in "Keywords" with "general,ideas"
        And I fill in "Description" with "test_cucumber"
        
        And I press "Save"
        Then I should see "general,ideas"
        Then I should see "test_cucumber"
    Scenario: Blank/duplicate should not be allowed
        When I press "Save"
        Then I should see "Category is invalid (blank/duplicate etc.)"