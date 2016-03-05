require 'rails/generators'

module Marionette
  module Generators
    class AppGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)

      def create_directory_structure
        %w(models collections routers utils views).each do |folder|
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
          home = routes.match(/root to: ['"]{1}([a-z_]+)\#index['"]{1}/).try :captures
          home = home.first
        else
          home = "home"
        end
        File.delete "app/views/#{home}/index.html.erb" if File.exist? "app/views/#{home}/index.html.erb"
        File.delete "app/views/#{home}/index.html.haml" if File.exist? "app/views/#{home}/index.html.haml"
        template "app/index.html.slim", "app/views/#{home}/index.html.slim"
      end

      def include_js
        gsub_file "app/assets/javascripts/application.js", "//= require_tree .", app_js_data
        inject_into_file "app/assets/javascripts/application.js", "//= require backbone/#{name.downcase}\n", after: "require marionette/lib/core/backbone.marionette\n"
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

        def app_js_data
<<RUBY
//= require console.style/console.style
//= require skim
//= require underscore/underscore
//= require backbone/backbone
//= require backbone.wreqr/lib/backbone.wreqr
//= require backbone.babysitter/lib/backbone.babysitter
//= require marionette/lib/core/backbone.marionette
//= require_tree ../templates
//= require ./backbone/config
//= require_tree ./backbone/utils
//= require_tree ./backbone/models
//= require_tree ./backbone/collections
//= require_tree ./backbone/views
//= require_tree ./backbone/routers
RUBY
        end

    end
  end
end
