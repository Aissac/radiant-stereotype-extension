class StereotypePagesDataset < Dataset::Base

  uses :pages
  
  def load
    create_page "With Stereotype"
  end
end