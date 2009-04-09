require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::PagesController do
  
  dataset :users
  
  before(:each) do
    login_as :developer
  end
  
  describe "handling GET index" do
    
    before(:each) do
      @config_records = add_to_config_table
      @config_keys = ['stereotype.post.layout', 'stereotype.post.parts', 'stereotype.post.page_type', 'stereotype.post.status']
      @stereotypes = ['post']
      Radiant::Config.stub!(:find).and_return(@config_records)
      @config_records.stub!(:map).and_return(@config_keys)
      @config_keys.stub!(:collect).and_return(@stereotypes)
    end
    
    it "is succesful" do
      get :index
      response.should be_success
    end
    
    it "should find stereotypes from the Radiant::Config table" do
      Radiant::Config.should_receive(:find).and_return(@config_records)
      @config_records.should_receive(:map).and_return(@config_keys)
      @config_keys.should_receive(:collect).and_return(@stereotypes)
      get :index
    end
  end
  
  def add_to_config_table
    post_layout = Radiant::Config.create(:key => 'stereotype.post.layout', :value => 'Normal')
    post_parts = Radiant::Config.create(:key => 'stereotype.post.parts', :value => 'body:Textile,sidebar:Markdown')
    post_page_type = Radiant::Config.create(:key => 'stereotype.post.page_type', :value => '')
    post_status = Radiant::Config.create(:key => 'stereotype.post.status', :value => 'published')    
    [post_layout, post_parts, post_page_type, post_status]
  end
  
end