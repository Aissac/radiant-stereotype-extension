Feature: Adding a stereotype
  In order to create page children with stereotypes
  As an admin
  I want to set a stereotype to a page
  
  Background:
    Given the page structure exists
      And the "article" stereotype exists
      And I am logged in as "admin"
  
  Scenario: Setting a stereotype on a page
    Given a page "pws" exists with title: "Page without stereotype", parent: page "hp"
      And I am on the admin pages index
     When I follow "Page without stereotype"
      And I select "article" from "Stereotype"
      And I press "Save Changes"
     Then a custom_field should exist with page: page "pws", name: "stereotype", value: "article"
  
  Scenario: Creating a child for a page with stereotype sets the stereotype values
    Given a page "pws" exists with title: "Page with stereotype", parent: page "hp"
      And a custom field "st" exists with name: "stereotype", value: "article", page: page "pws"
      And I am on the admin pages index
     When I follow "Add Child" for page "pws"
      And I fill in "Page Title" with "Child page"
      And I fill in "Slug" with "child-page"
      And I fill in "Breadcrumb" with "Child page"
      And I press "Create Page"
     Then a page "child" should exist with title: "Child page", layout: layout "main", class_name: "ArchivePage", status_id: "100"
      And a page part should exist with page: page "child", name: "body", filter_id: "Markdown"
      And a page part should exist with page: page "child", name: "sidebar", filter_id: "Textile"

