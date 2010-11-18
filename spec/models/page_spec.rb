require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  dataset :pages, :custom_fields
  
  before do
    @page_first = pages(:first)
  end
  
  it "is valid" do
    @page_first.should be_valid
  end
  
  describe Page, "#update_custom_fields" do
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
  
  describe Page, "#new_with_defaults_with_stereotype" do
    subject { pages(:parent).children.new_with_defaults_with_stereotype(config) }
    
    context "specifying page parts and filters" do
      context "when page parts and filters are specified in stereotype" do
        let(:config) {
          { "stereotype.post.parts" => "body:Textile,sidebar:Markdown" }
        }
        
        it "creates a new page with specified parts and filters" do
          subject.parts[0].name.should == "body"
          subject.parts[1].name.should == "sidebar"
          subject.parts[0].filter_id.should == "Textile"
          subject.parts[1].filter_id.should == "Markdown"
        end
      end
      
      context "when page parts and filters are not specified in stereotype" do
        let(:config) {
          { 
            "defaults.page.parts" => "body,extended",
            "defaults.page.filter" => "Textile"
          }
        }
        
        it "creates a new page with default parts and filters" do
          subject.parts[0].name.should == "body"
          subject.parts[1].name.should == "extended"
          subject.parts[0].filter_id.should == "Textile"
          subject.parts[1].filter_id.should == "Textile"
        end
      end
    end
    
    context "specifying status" do
      context "when status specified by stereotype" do
        let(:config) {
          { "stereotype.post.status" => "Published" }
        }
        
        it "creates a new page with specified status" do
          subject.status_id.should == Status["published"].id
        end
      end

      context "when status not specified by stereotype" do
        let(:config) {
          { "defaults.page.status" => "draft" }
        }
        
        it "creates a new page with default " do
          subject.status_id.should == Status["draft"].id
        end
      end
    end
    
    context "specifying layout" do
      let(:config) {
        { "stereotype.post.layout" => "Main" }
      }
      
      it "creates a new page with stereotype specified layout" do
        layout = layouts(:main)
        subject.layout_id.should == layout.id
      end
    end
        
    context "specifying page type" do
      let(:config) {
        { "stereotype.post.page_type" => "ArchivePage" }
      }
      
      it "creates a new page with stereotype specified class name" do
        subject.class_name.should == "ArchivePage"
      end
    end
    
    context "specified stereotype" do
      let(:config) {
        { "stereotype.post.stereotype" => "post_child" }
      }
      
      it "creates a new page with stereotype specified stereotype" do
        subject.stereotype.should == "post_child"
      end
    end
  end
end