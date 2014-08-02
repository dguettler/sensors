require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Ecorpm
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_mailer.default_url_options = {
      host: ENV['HOST'],
      protocol: ENV['PROTOCOL']
    }

    # Enable CORS
    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '/*', :headers => :any, :methods => [:get, :post, :put, :patch, :delete, :options]
      end
    end

  end
end
