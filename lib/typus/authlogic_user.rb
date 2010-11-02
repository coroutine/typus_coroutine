module Typus
  module AuthlogicUser
    def self.included(base)
      base.send :include, InstanceMethods
    end
    
    module InstanceMethods
      include Typus::EnableAsTypusUser::InstanceMethods
      
      def is_root?
        typus_role_name == Typus.master_role
      end
      
      def is_not_root?
        !is_root?
      end
      
      def resources
        (Typus::Configuration.roles[typus_role_name] || {}).compact
      end
      
      def typus_role_name
        "admin"
      end
      
      def name
        "#{self.class.name}:#{self.id}"
      end
    end
  end
end
