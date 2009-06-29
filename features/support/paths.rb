module NavigationHelpers
  def path_to(page_name)
    case page_name
    
    when /the welcome page/
      welcome_path
    
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in features/support/paths.rb"
    end
  end
end

World(NavigationHelpers)