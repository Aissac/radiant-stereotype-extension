module Stereotype
  module PageExtensions
    
    def self.included(base)
      base.extend ClassMethods
      base.class_eval do
        class << self
          alias_method_chain :new_with_defaults, :stereotype
        end
        after_save :update_custom_fields
        include InstanceMethods
      end
    end
    
    module InstanceMethods
      def stereotype
        @stereotype ||= if field = custom_fields.find(:first, :conditions => {:name => 'stereotype'})
          field.value
        end
      end
      
      def stereotype=(_stereotype)
        @stereotype = _stereotype
      end
      
      def update_custom_fields
        cf = self.custom_fields.find(:first, :conditions => ["name = ?", "stereotype"])
        cf.destroy if cf
        self.custom_fields.create(:name => 'stereotype', :value => @stereotype)
      end
    end
    
    module ClassMethods
      def new_with_defaults_with_stereotype(config=Radiant::Config)
        page = new
      
        custom_field = CustomField.find(:first, :conditions => { :name => "stereotype", :page_id => page.parent_id})
        name = custom_field && custom_field.value
      
        if name
          set_page_parts(page, name, config)
          
          set_page_status(page, name, config)
        
          set_page_layout(page, name, config)
          
          set_page_class_name(page, name, config)
          
          set_page_stereotype(page, name, config)
          
          page
        else
          new_with_defaults_without_stereotype(config)
        end
      end
      private
        def set_page_parts(page, name, config)
           if config["stereotype.#{name}.parts"].blank?
             page.parts << default_page_parts(config)
           else
             page.parts << stereotype_page_parts(name, config)
           end
             
        end
      
        def stereotype_page_parts(name, config)
          parts_and_filters = config["stereotype.#{name}.parts"].to_s.strip.split(',')
        
          parts_and_filters.map do |part_and_filter|
            part_name, filter = part_and_filter.to_s.split(':')
            PagePart.new(:name => part_name, :filter_id => filter)
          end
        end
      
        def set_page_status(page, name, config)
          default_status = config["stereotype.#{name}.status"] || config['defaults.page.status']
          page.status = Status[default_status] if default_status
        end
      
        def set_page_layout(page, name, config)
          default_layout = Layout.find_by_name(config["stereotype.#{name}.layout"])
          page.layout_id = default_layout.id if default_layout
        end
      
        def set_page_class_name(page, name, config)
          default_page_type = config["stereotype.#{name}.page_type"]
          page.class_name = default_page_type if default_page_type
        end
      
        def set_page_stereotype(page, name, config)
          default_stereotype = config["stereotype.#{name}.stereotype"]
          page.stereotype = default_stereotype if default_stereotype
        end
    end
  end
end