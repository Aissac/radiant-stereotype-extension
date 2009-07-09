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
    
    before do
    @parent = pages(:parent)
    @page = @parent.children.new_with_defaults_with_stereotype(config_hash)
    end

    it "creates a new page with stereotype.post.layout Layout" do
      layout = layouts(:main)
      @page.layout_id.should == layout.id
    end
    
    it "creates a new page with stereotype.post.page_type ClassName" do
      @page.class_name.should == "ArchivePage"
    end
    
    it "creates a new page with stereotype.post.parts Page Parts and Filters" do
      @page.parts[0].name.should == "body"
      @page.parts[1].name.should == "sidebar"
      @page.parts[0].filter_id.should == "Textile"
      @page.parts[1].filter_id.should == "Markdown"
    end
    
    it "creates a new page with stereotype.post.status Status" do
      @page.status_id.should == Status["published"].id
    end
    
    it "creates a new page with stereotype.post.stereotype Stereotype" do
      @page.stereotype.should == "post_child"
    end
  end

  def config_hash    
    {
      "stereotype.post.page_type" => "ArchivePage",
      "stereotype.post.layout" => "Main",
      "stereotype.post.parts" => "body:Textile,sidebar:Markdown",
      "stereotype.post.status" => "published",
      "stereotype.post.stereotype" => "post_child"
    }
  end
end