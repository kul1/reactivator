module Reactivator
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Install reactivator component to existing Rails app "
      def self.source_root
        File.dirname(__FILE__) + "/templates"
      end

      def setup_gems
        gem 'maruku', '~> 0.7.3'
        gem 'rouge'
        gem 'normalize-rails'
        gem 'font-awesome-sass', '~> 4.7.0'
        gem 'ckeditor', github: 'galetahub/ckeditor'

        gem 'mongoid-paperclip', require: 'mongoid_paperclip'
        gem 'meta-tags'
        gem 'jquery-turbolinks'
        gem 'mongo', '~> 2.2'
        gem 'bson', '~> 4.0'
        gem 'mongoid', '6.1.0'
        gem 'nokogiri' # use for reactivator/doc
        gem 'haml', git: 'https://github.com/haml/haml'
        gem 'haml-rails'
        gem 'mail'
        gem 'prawn'
        gem 'redcarpet'
        gem 'bcrypt'
        gem 'omniauth-identity'
        gem 'omniauth-facebook'
	    gem 'omniauth-google-oauth2'
        gem 'dotenv-rails'
        gem 'cloudinary'
        gem 'kaminari'
        gem 'kaminari-mongoid'
        gem 'jquery-rails'
        gem_group :development, :test do
          gem 'rspec'
          gem 'rspec-rails'
          gem 'better_errors'
          gem 'binding_of_caller'
          gem 'pry-byebug'
          gem 'factory_bot_rails'
		  gem 'database_cleaner'
          gem 'guard'
          gem 'guard-rspec'
          gem 'guard-minitest'
          gem 'capybara'
		  gem 'selenium-webdriver'
          gem 'rb-fsevent'
		  gem 'valid_attribute'
          gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
        end
      end

      def setup_app
        # inside("public") { run "FileUtils.mv index.html index.html.bak" }
          inside("db") {(File.file? "seeds.rb") ? (FileUtils.mv "seeds.rb", "seeds.rb.bak") : ( say "no seeds.rb", :green)}
        inside("app/views/layouts") {(File.file? "application.html.erb") ? (FileUtils.mv 'application.html.erb', 'application.html.erb.bak') : ( say "no app/views/layout/ application.html.erb", :blue )}
        inside("app/controllers") {(File.file? "application_controller.rb") ? (FileUtils.mv 'application_controller.rb', 'application_controller.rb.bak' ) : ( say "no app/controller/application_controller.rb, :blue ")}
        inside("app/helpers") {(File.file? "application_helper.rb") ? (FileUtils.mv 'application_helper.rb', 'application_helper.rb.bak') : ( say "no app/helpers/application_helper.rb", :blue)}
        inside("app/assets/javascripts") {(File.file? "javascripts.js") ? (FileUtils.mv 'javascripts.js', 'javascripts.js.bak') : ( say "no javascript.js", :blue)}
        inside("app/assets/stylesheets") {(File.file? "application.css") ? (FileUtils.mv 'application.css', 'application.css.bak') : ( say "no application.css", :blue)}
        inside("config/initializers") {(File.file? "omniauth.rb") ? (FileUtils.mv 'omniauth.rb', 'omniauth.rb.bak') : (say "no omniauth.rb", :blue)}
        # inside("config/initializers") {(File.file? "mongoid.rb") ? (FileUtils.mv 'mongoid.rb', 'mongoid.rb.bak') : (say "no mongoid.rb")}
        # inside("config/initializers") {(File.file? "ckeditor.rb") ? (FileUtils.mv 'ckeditor.rb ckeditor.rb.bak') : (say "no ckeditor.rb ")}
        directory "app"
        directory "spec"
        directory "db"
        directory "config"
        directory "dot"
        # 
        # CHECK IF EXISTING CODE THEN REQUIRED MANUAL MIGRATION
        # If no javascripts.js or css (New application), then can use javascript.js or css from org files.
        inside("app/assets/javascripts") {(File.file? "application.js") ? ( say "Please include application-org.js in application.js", :red) : (FileUtils.mv 'application-org.js', 'application.js')}
        inside("app/assets/stylesheets") {(File.file? "application.css") ? ( say "Please include application-org.css in application.css", :red) : (FileUtils.mv 'application-org.css', 'application.css')}
        inside("app/assets/stylesheets") {(File.file? "application.css.scss") ? ( say "Please include application-org.css.scss in application.css.scss", :red) : (FileUtils.mv 'application-org.css.scss', 'application.css.scss')}
        inside("app/controllers") {(File.file? "application_controller.rb") ? ( say "Pleas merge existing reactivator-org/application_controller.rb after this installation", :red) : (FileUtils.mv 'reactivator-org/application_controller.rb', 'application_controller.rb')}
        inside("app/controllers") {(File.file? "admins_controller.rb") ? ( say "Please merge existing reactivator-org/admins_controller.rb after this installation", :red) : (FileUtils.mv 'reactivator-org/admins_controller.rb', 'admins_controller.rb')}
        inside("app/controllers") {(File.file? "articles_controller.rb") ? ( say "Please merge existing reactivator-org/articles_controller.rb after this installation", :red) : (FileUtils.mv 'reactivator-org/articles_controller.rb', 'articles_controller.rb')}
        inside("app/controllers") {(File.file? "comments_controller.rb") ? ( say "Please merge existing reactivator-org/comments_controller.rb after this installation", :red) : (FileUtils.mv 'reactivator-org/comments_controller.rb', 'comments_controller.rb')}
        inside("app/controllers") {(File.file? "identities_controller.rb") ? ( say "Please merge existing reactivator-org/identities_controller.rb after this installation", :red) : (FileUtils.mv 'reactivator-org/identities_controller.rb', 'identities_controller.rb')}
        inside("app/controllers") {(File.file? "reactivator_controller.rb") ? ( say "Please merge existing reactivator-org/reactivator_controller.rb after this installation", :red) : (FileUtils.mv 'reactivator-org/reactivator_controller.rb', 'reactivator_controller.rb')}
        inside("app/controllers") {(File.file? "password_resets_controller.rb") ? ( say "Please merge existing reactivator-org/password_resets_controller.rb after this installation", :red) : (FileUtils.mv 'reactivator-org/password_resets_controller.rb', 'password_resets_controller.rb')}
        inside("app/controllers") {(File.file? "password_resets.rb") ? ( say "Please merge existing reactivator-org/password_resets.rb after this installation", :red) : (FileUtils.mv 'reactivator-org/password_resets.rb', 'password_resets.rb')}
        inside("app/controllers") {(File.file? "sessions_controller.rb") ? ( say "Please merge existing reactivator-org/sessions_controller.rb after this installation", :red) : (FileUtils.mv 'reactivator-org/sessions_controller.rb', 'sessions_controller.rb')}
        inside("app/controllers") {(File.file? "users_controller.rb") ? ( say "Please merge existing reactivator-org/users_controller.rb after this installation", :red) : (FileUtils.mv 'reactivator-org/users_controller.rb', 'users_controller.rb')}
        inside("app/controllers") {(File.file? "sitemap_controller.rb") ? ( say "Please merge existing reactivator-org/sitemap_controller.rb after this installation", :red) : (FileUtils.mv 'reactivator-org/sitemap_controller.rb', 'sitemap_controller.rb')}
      end
      # routes created each line as reversed order button up in routes
      def setup_routes
        route "root :to => 'reactivator#index'"        
        route "resources :reactivator, :only => [:index, :new]"
        route "resources :password_resets"
        route "resources :sessions"
        route "resources :identities"
        route "resources :users"
        route "resources :articles"
		route "get '/articles/my/destroy' => 'articles#destroy'"
        route "get '/articles/my' => 'articles/my'"
        route "get '/logout' => 'sessions#destroy', :as => 'logout'"
        route "get '/auth/failure' => 'sessions#destroy'"
        route "get '/auth/:provider/callback' => 'sessions#create'"
        route "post '/auth/:provider/callback' => 'sessions#create'"        
		route "\# end reactivator method routes"
        route "mount Ckeditor::Engine => '/ckeditor'"
        route "post '/reactivator/end_form' => 'reactivator#end_form'"
        route "post '/reactivator/pending' => 'reactivator#index'"
        route "post '/reactivator/init' => 'reactivator#init'"
        route "reactivator_methods.each do \|aktion\| get \"/reactivator/\#\{aktion\}\" => \"reactivator#\#\{aktion\}\" end"
        route "reactivator_methods += ['init','run','run_do','run_form','end_form','error_logs', 'notice_logs', 'cancel']"
        route "reactivator_methods = ['pending','status','search','doc','logs','ajax_notice']"  
        route "\# start jiinda method routes"
	  end

      def setup_env
        FileUtils.mv "README.md", "README.md.bak"
        create_file 'README.md', ''
        # FileUtils.mv 'install.sh', 'install.sh'
        # inject_into_file 'config/application.rb', :after => 'require "active_resource/railtie"' do
        # inject_into_file 'config/application.rb', :after => 'require "rails"' do
        #   "\nrequire 'rexml/document'\n"+
        #   "\nrequire 'mongoid/railtie'\n"
        # end
        application do
%q{
  # Reactivator default
  config.generators do |g|
    g.orm             :mongoid
    g.template_engine :haml
    g.test_framework  :rspec
    g.integration_tool :rspec
  end

  # config time zone
  # config.time_zone = "Central Time (US & Canada)"

  # gmail config
  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  #   :address              => "smtp.gmail.com",
  #   :port                 => 587,
  #   :user_name            => 'user@gmail.com',
  #   :password             => 'secret',
  #   :authentication       => 'plain',
  #   :enable_starttls_auto => true  }
  # config.action_mailer.raise_delivery_errors = true
  # config.action_mailer.perform_deliveries = true
}
        end
        initializer "reactivator.rb" do
%q{# encoding: utf-8
MM = "#{Rails.root}/app/reactivator/index.mm"
DEFAULT_TITLE = 'Reactivator'
DEFAULT_HEADER = 'Reactivator'
DEFAULT_DESCRIPTION = 'Rails Application Generator'
DEFAULT_KEYWORDS = %w[Reactivator Rails ruby Generator]
GMAP = false
# ADSENSE = true
NEXT = "Next >"
# comment IMAGE_LOCATION to use cloudinary (specify params in config/cloudinary.yml)
IMAGE_LOCATION = "upload"
# for debugging
# DONT_SEND_MAIL = true
}
        end

initializer "mongoid.rb" do
%q{# encoding: utf-8
#
# Mongoid 6 follows the new pattern of AR5 requiring a belongs_to relation to always require its parent
# belongs_to` will now trigger a validation error by default if the association is not present.
# You can turn this off on a per-association basis with `optional: true`.
# (Note this new default only applies to new Rails apps that will be generated with
# `config.active_record.belongs_to_required_by_default = true` in initializer.)
#
Mongoid::Config.belongs_to_required_by_default = false
}
        end

        inject_into_file 'config/environment.rb', :after => "initialize!"  do
          "\n\n# hack to fix cloudinary error https://github.com/archiloque/rest-client/issues/141" +
          "\nclass Hash\n  remove_method :read\nrescue\nend"
        end
        inject_into_file 'config/environments/development.rb', :after => 'config.action_mailer.raise_delivery_errors = false' do
          "\n  config.action_mailer.default_url_options = { :host => 'localhost:3000' }"
        end
        inject_into_file 'config/environments/production.rb', :after => 'config.assets.compile = false' do
          "\n  config.assets.compile = true"
        end
        inject_into_file 'config/initializers/assets.rb', :after => '# Precompile additional assets.
' do        
"Rails.application.config.assets.precompile += %w( sarabun.css )" +
"\nRails.application.config.assets.precompile += %w( disable_enter_key.js )\n"
        end
      end

      def finish
        say "\n"
        say "Reactivator gem ready for next configuration install.\n"
        say "    (or short cut with sh install.sh)\n" 
        say "Normally you will use  the following command:\n"
        say "----------------------------------------\n"
        say "bundle install\n"
        say "rails generate reactivator:config\n"
        say "rake reactivator:seed\n"
        say 
        say "----------------------------------------\n"
      end
    end
  end
end
