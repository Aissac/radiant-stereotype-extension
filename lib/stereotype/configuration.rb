module Stereotype
  class Configuration
    
    def self.quoted_column_name
      ActiveRecord::Base.connection.quote_column_name('key')
    end
    
    def self.settings
      Radiant::Config.find(:all, :conditions => ["#{quoted_column_name} LIKE ?", 'stereotype.%'])
    end
    
    def self.names
      settings.map(&:key).map {|k| k.split('.')[1] }.uniq.sort
    end
    
  end
end