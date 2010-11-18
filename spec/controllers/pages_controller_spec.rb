require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::PagesController do
  
  dataset :users
  
  before(:each) do
    login_as :existing
  end
  
  describe "handling GET index" do
    before(:each) do
      configuration = {
        'stereotype.post.layout'      => 'Normal',
        'stereotype.post.parts'       => 'body:Textile,sidebar:Markdown',
        'stereotype.post.status'      => 'published'
      }
      
      configuration.each {|k,v| Radiant::Config.create!(:key => k, :value => v) }
    end
    
    it "should be succesful" do
      get :index
      response.should be_success
    end
    
    it "should assign :stereotypes" do
      get :index
      assigns(:stereotypes).should == ['post']
    end
  end
end