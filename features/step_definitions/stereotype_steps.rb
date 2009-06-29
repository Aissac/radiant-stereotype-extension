Given /^I am logged in as admin$/ do
  Given "I go to to \"the welcome page\""
   When "I fill in \"Username\" with \"admin\""
   When "I fill in \"Password\" with \"password\""
   When "I press \"Login\""
end

When /^I set the stereotype to "([^\"]*)" on the "([^\"]*)" page$/ do |stereotype, page|
  When "I follow \"#{page}\""
  When "I select \"#{stereotype}\" from \"page_stereotype\""
  When "I press \"Save Changes\""
end

When /^I fill in all needed information in the new page$/ do
  When "I fill in \"Page Title\" with \"First Stereotype Child\""
  When "I fill in \"Slug\" with \"first-stereotype-child\""
  When "I fill in \"Breadcrumb\" with \"First Stereotype Child\""
end

When /^I create a new child for the "([^\"]*)" page$/ do |page|
  visit new_admin_page_child_path(pages(:with_stereotype).id)
end

Then /^the new page should have the body page part with Markdown filter$/ do
  @page = pages(:with_stereotype).children.first
  @page.parts[0].name.should == "body"
  @page.parts[0].filter_id.should == "Markdown"
end

Then /^the new page should have the sidebar page part with Textile filter$/ do
  @page = pages(:with_stereotype).children.first
  @page.parts[1].name.should == "sidebar"
  @page.parts[1].filter_id.should == "Textile"
end

Then /^the new page should have the "([^\"]*)" layout$/ do |layout|
  pages(:with_stereotype).children.first.layout.name.should == layout
end

Then /^the new page should have status "([^\"]*)"$/ do |arg1|
  pages(:with_stereotype).children.first.status.should == Status["published"]
end

Then /^the new page should have "([^\"]*)" page type$/ do |arg1|
  pages(:with_stereotype).children.first.class_name.should == "ArchivePage"
end