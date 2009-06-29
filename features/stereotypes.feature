Feature: Adding a stereotype
  In order to create page children with stereotype
  As an admin
  I want to set a stereotype to a page

  Scenario: title
    Given I am logged in as admin
     When I set the stereotype to "Post" on the "With Stereotype" page

     When I create a new child for the "With Stereotype" page
     When I fill in all needed information in the new page
      And I press "Create Page"
     Then I should see "Your page has been saved below."
     
      And the new page should have the body page part with Markdown filter
      And the new page should have the sidebar page part with Textile filter
      And the new page should have the "Main" layout
      And the new page should have status "published"
      And the new page should have "ArchivePage" page type