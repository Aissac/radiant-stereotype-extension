module Stereotype
  module PageExtensions
    
    def self.included(base)
      base.extend ClassMethods
      base.class_eval do
        class <<self
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
      def new_with_defaults_with_stereotype(config = Radiant::Config)
        page = new
      
        custom_field = CustomField.find(:first, :conditions => { :name => "stereotype", :page_id => page.parent_id})
        name = custom_field && custom_field.value
      
        if name
          parts_and_filters = config["stereotype.#{name}.parts"].blank? ? config["defaults.page.parts"].to_s.strip.split(',') : config["stereotype.#{name}.parts"].to_s.strip.split(',')
          
          parts_and_filters.each do |part_and_filter|
            part_filter = part_and_filter.to_s.split(':')
            
            st_name = part_filter[0].nil? ? "" : part_filter[0]
            st_filter = part_filter[1].nil? ? "" : part_filter[1].gsub('_', ' ').capitalize
            page.parts << PagePart.new(:name => st_name, :filter_id => st_filter)
          end
      
          st_layout = Layout.find_by_name(config["stereotype.#{name}.layout"])
          st_layout_id = st_layout.nil? ? nil : st_layout.id
          page.layout_id = st_layout_id if st_layout_id
      
          st_class_name = config["stereotype.#{name}.page_type"]
          page.class_name = st_class_name if st_class_name
          
          st_status = config["stereotype.#{name}.status"]
          page.status = Status[st_status] if st_status
          
          st_stereotype = config["stereotype.#{name}.stereotype"]
          page.stereotype = st_stereotype if st_stereotype
          
          page
        else
          new_with_defaults_without_stereotype(config)
        end
      end
    end
  end
end