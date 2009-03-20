require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  
  dataset :pages, :custom_fields
  
  before do
    @page_first = pages(:first)
  end
  
  it "is valid" do
    @page_first.should be_valid
  end
  
  describe Page, "handling update_custom_fields" do
    
    it "finds the coresponding custom_field (stereotype)" do
      @page_first.custom_fields.should == [custom_fields(:first_st)]
      @page_first.save
    end
    
    it "destroys the stereotype if is set to none" do
      lambda do
        cf = custom_fields(:first_st)
        @page_first.update_attributes(:stereotype => '')
      end.should change(CustomField, :count).by(-1)
    end
    
    it "creates a new stereotype in custom_fields table" do
      @page_first.update_attributes(:stereotype => 'article')
      @page_first.custom_fields[0].value.should == 'article'
    end
  end
  
  describe Page, "handling new_with_defaults_with_stereotype" do
    
    before(:all) do
      @config = add_to_config_table
    end
    
    it "" do
      puts Page.new_with_defaults_with_stereotype(@config)
    end
  end
  
  def add_to_config_table
    post_layout = Radiant::Config.create(:key => 'stereotype.post.layout', :value => 'Normal')
    post_parts = Radiant::Config.create(:key => 'stereotype.post.parts', :value => 'body:Textile,sidebar:Markdown')
    post_page_type = Radiant::Config.create(:key => 'stereotype.post.page_type', :value => '')    
    [post_layout, post_parts, post_page_type]
  end
  
end