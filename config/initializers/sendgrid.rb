ActionMailer::Base.smtp_settings = {
  user_name: Rails.application.credentials.dig(:sendgrid, :username),
  password: Rails.application.credentials.dig(:sendgrid, :password),
  domain: Rails.application.credentials.dig(:sendgrid, :domain),
  address: Rails.application.credentials.dig(:sendgrid, :address),
  port: Rails.application.credentials.dig(:sendgrid, :port),
  authentication: :plain,
  enable_starttls_auto: true
}