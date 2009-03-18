# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

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
    # admin.tabs.add "Stereotype", "/admin/stereotype", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Stereotype"
  end
  
end
