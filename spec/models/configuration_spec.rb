require File.dirname(__FILE__) + '/../spec_helper'

describe Stereotype::Configuration do
  
  it "should be able to generate the quoted column name for the conditions" do
    connection = mock('connection', :null_object => true)
    connection.should_receive(:quote_column_name).with('key').and_return('`key`')
    
    ActiveRecord::Base.should_receive(:connection).at_least(:once).with(no_args()).and_return(connection)
    
    Stereotype::Configuration.quoted_column_name.should == '`key`'
  end
  
  it "should be able to find a list of matching configuration settings" do
    names = %w(stereotype.foo.pages stereotype.foo.layout stereotype.blip.pages)
    names.each {|name| Radiant::Config.create!(:key => name, :value => nil) }
    
    Stereotype::Configuration.settings.map(&:key).sort.should == names.sort
  end
  
  it "should be able to return a list of names" do
    names = %w(stereotype.foo.pages stereotype.foo.layout stereotype.blip.pages)
    names.each {|name| Radiant::Config.create!(:key => name, :value => nil) }
  
    Stereotype::Configuration.names.should == ['blip', 'foo']
  end
  
end
