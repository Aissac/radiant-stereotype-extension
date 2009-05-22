module Stereotype
  module PagesControllerExtensions
    
    def self.included(base)
      base.class_eval do
        before_filter :find_stereotypes
      end
    end
    
    def find_stereotypes
      quoted_column_name = Radiant::Config.connection.quote_column_name('key')
      @stereotypes = Radiant::Config.find(:all, :conditions => [ "#{quoted_column_name} LIKE ?", "stereotype%"]).map(&:key).collect{|k| k.split('.')[1]}.uniq
    end
  end
end