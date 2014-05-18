@zombie
Feature: See all posted episodes
  As a visitor to the site
  I want to see all published episodes
  So that I can browse and listen to a podcast

  Scenario: Go to the home page to see all episodes
    Given 3 episodes exist
    When I go to the home page
    Then I should see 3 episodes with titles
