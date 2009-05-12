module Stereotype
  module PagesControllerExtensions
    
    def self.included(base)
      base.class_eval do
        before_filter :find_stereotypes
      end
    end
    
    def find_stereotypes
      @stereotypes = Radiant::Config.find(:all, :conditions => [ "'key' LIKE ?", "stereotype%"]).map(&:key).collect{|k| k.split('.')[1]}.uniq
    end
  end
end