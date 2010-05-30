Given /^I am logged in as "([^\"]*)"$/ do |role|
  Given %Q{an #{role} "#{role}" exists with login: "#{role}", password: "secret"}
  When %Q{I am on the welcome page}
   And %Q{I fill in "Username or E-mail Address" with "#{role}"}
   And %Q{I fill in "Password" with "secret"}
   And %Q{I press "Login"}
end

Given /^the page structure exists$/ do
  Given %Q{a home page "hp" exists with title: "Home Page"}
  Given %Q(a layout "main" exists with name: "Main")
end

Given /^the "([^\"]*)" stereotype exists$/ do |st|
  Radiant::Config["stereotype.#{st}.parts"] = "body:Markdown,sidebar:Textile"
  Radiant::Config["stereotype.#{st}.layout"] = 'Main'
  Radiant::Config["stereotype.#{st}.status"] = 'Published'
  Radiant::Config["stereotype.#{st}.page_type"] = 'ArchivePage'
end

When /^I follow "([^\"]*)" for #{capture_model}$/ do |link, target|
  record = model(target)
  with_scope("##{dom_id(record)}") do
    click_link(link)
  end
end