module Stereotype
  module PagesControllerExtensions
    
    def self.included(base)
      base.class_eval { before_filter :find_stereotypes }
    end
    
    def find_stereotypes
      @stereotypes = Stereotype::Configuration.names
    end
  end
end