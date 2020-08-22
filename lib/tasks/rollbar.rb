task :environment do
  Rollbar.configure do |config |
    config.access_token = Rails.application.credentials.dig(:rollbar, :access_token)
  end
end
