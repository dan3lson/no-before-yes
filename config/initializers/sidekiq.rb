Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDISTOGO_URL'], namespace: "no_before_yes_sidekiq_#{Rails.env}" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDISTOGO_URL'], namespace: "no_before_yes_sidekiq_#{Rails.env}" }
end
