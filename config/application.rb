require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Airbnb
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :ja
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| %Q(#{html_tag}).html_safe }
    config.generators do |g|
      g.assets     false
      g.helper     false
    end
  end
end
