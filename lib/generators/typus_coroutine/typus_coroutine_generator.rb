module TypusCoroutine
  module Generators
    class TypusCoroutineGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      
      namespace "typus_coroutine"
      
      desc "Copies all Coroutine Typus assets to your application"
      
      def copy_assets
        Dir["#{templates_path}/public/**/*.*"].each do |file|
          copy_file file.split("#{templates_path}/").last
        end
      end
      
      private
        
      def templates_path
        File.join(File.dirname(__FILE__), "..", "templates")
      end
    end
  end
end
