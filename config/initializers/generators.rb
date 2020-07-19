# frozen_string_literal: true

Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
  g.test_framework :rspec,
                   view_specs: false,
                   routing_specs: false,
                   request_specs: false,
                   controller_specs: false
  g.fixture_replacement :factory_bot, dir: 'spec/factories'
  g.helper false
  g.jbuilder false
  g.stylesheets false
end
