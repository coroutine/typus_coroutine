module Typus
  module Authentication
    module Authlogic
      protected
      
      include Base
      include Session
      
      class UserProxy
        def initialize(target)
          @target = target
        end
        
        def role
          @target.typus_role_name
        end
        
        def method_missing(method, *args, &block)
          @target.send(method, *args, &block)
        end
      end
      
      def decorate_user(u)
        UserProxy.new(u)
      end
      
      def authenticate
        if UserSession.find
          current_user
        else
          redirect_to login_url
        end
      end
      
      def current_user
        decorate_user UserSession.find.user
      end
    end
  end
end
