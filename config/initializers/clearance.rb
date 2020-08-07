Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = 'hello@nobeforeyes.com'
  config.rotate_csrf_on_sign_in = true
end
