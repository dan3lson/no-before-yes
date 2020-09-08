Rails.application.configure do
  config.action_mailer.preview_path = "#{Rails.root}/spec/mailers/previews"
  config.serve_static_assets = true
end
