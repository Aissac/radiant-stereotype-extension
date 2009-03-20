# Uncomment this if you reference any of your controllers in activate
require_dependency 'application'

class StereotypeExtension < Radiant::Extension
  version "0.1"
  description "Provides templates"
  url "http://blog.aissac.ro/radiant/stereotype-extension/"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :stereotype
  #   end
  # end
  
  def activate
    Page.send :include, Stereotype::PageExtensions
    Admin::PagesController.class_eval do
      include Stereotype::PagesControllerExtensions
    end
    
    admin.page.edit.add :parts_bottom, "admin/stereotype", :after => "edit_layout_and_type"
    admin.page.index.add :sitemap_head, 'admin/stereotype_th', :after => "remove_child_column"
    admin.page.index.add :node, 'admin/stereotype_td', :after => "remove_child_column"
  end
  
  def deactivate
    # admin.tabs.remove "Stereotype"
  end
  
end
