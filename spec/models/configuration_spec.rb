require File.dirname(__FILE__) + '/../spec_helper'

describe Stereotype::Configuration do
  subject { Stereotype::Configuration }
    
  describe ".settings" do
    let(:names) { %w(stereotype.foo.pages stereotype.foo.layout stereotype.bar.pages) }
    
    before(:each) do
      names.each do |name|
        Radiant::Config.create!(:key => name, :value => nil)
      end
    end
    
    it "finds a list of matching configuration settings" do
      subject.settings.map(&:key).sort.should == names.sort
    end
  end

  describe ".names" do
    let(:names) { %w(stereotype.foo.pages stereotype.foo.layout stereotype.bar.pages) }
    
    before(:each) do
      names.each do |name|
        Radiant::Config.create!(:key => name, :value => nil)
      end
    end
    
    its(:names) { should == ['bar', 'foo'] }
  end
end
