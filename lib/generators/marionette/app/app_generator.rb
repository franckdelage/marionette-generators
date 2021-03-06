require 'rails/generators'

module Marionette
  module Generators
    class AppGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)

      def create_directory_structure
        %w(models collections regions behaviors routers utils views).each do |folder|
          empty_directory "app/assets/javascripts/backbone/#{folder}"
          template "app/gitkeep", "app/assets/javascripts/backbone/#{folder}/.gitkeep"
        end
        empty_directory "app/assets/templates"
      end

      def add_backbone_via_bower
        gem 'bower-rails'
        bundle_install
        generate "bower_rails:initialize"
        append_to_file "Bowerfile", bower_data, after: "for more options\n"
        rake 'bower:install'
        rake 'bower:clean'
      end

      def create_files
        gem 'skim'
        bundle_install
        template "app/marionette_app.js", "app/assets/javascripts/#{file_name}_app.js"
        backbone = "app/assets/javascripts/backbone"
        template "app/app.js.coffee", "#{backbone}/#{file_name}.js.coffee"
        template "app/layout.jst.skim", "app/assets/templates/layouts/layout.jst.skim"
        template "app/logger.js.coffee", "#{backbone}/utils/logger.js.coffee"
        template "app/defaults.js.coffee", "#{backbone}/utils/defaults.js.coffee"
        template "app/config.js.coffee", "#{backbone}/config.js.coffee"
        template "app/layout.js.coffee", "#{backbone}/views/layouts/layout.js.coffee"
        template "app/app_router.js.coffee", "#{backbone}/routers/app_router.js.coffee"
        template "app/application.html.slim", "app/views/layouts/application.html.slim"
      end

      def add_app_to_index_view
        gem 'slim-rails'
        bundle_install
        if File.exist? "config/routes.rb"
          routes = File.read "config/routes.rb"
          captures = routes.match(/(\s*#\s*|)root( to:|) ['"]{1}([a-z_]+)\#index['"]{1}/).try :captures
          if captures.first.empty?
            home = captures.last
          else
            home = "visitors"
            append_to_file "config/routes.rb", "  root to: '#{home}#index'", after: "routes.draw do\n"
          end
        else
          home = "visitors"
        end
        unless File.exist? "app/controllers/#{home}"
          generate "controller", "#{home.capitalize} index --skip-routes --skip-javascripts --skip-stylesheets"
        end
        File.delete "app/views/#{home}/index.html.erb" if File.exist? "app/views/#{home}/index.html.erb"
        File.delete "app/views/#{home}/index.html.haml" if File.exist? "app/views/#{home}/index.html.haml"
        File.delete "app/views/#{home}/index.html.slim" if File.exist? "app/views/#{home}/index.html.slim"
        template "app/index.html.slim", "app/views/#{home}/index.html.slim"
      end

      def include_js
        gsub_file "app/assets/javascripts/application.js", "//= require_tree .", "//= require #{name.downcase}_app"
      end

      private
        def bundle_install
          Bundler.with_clean_env do
            run "bundle install"
          end
        end

        def bower_data
<<RUBY
asset 'console.style'  
asset 'backbone'
asset 'marionette'  
RUBY
        end

    end
  end
end
