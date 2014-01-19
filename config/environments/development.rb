Projfolio::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Rails mod upon 4.0 update
  config.eager_load = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
 
  # ATTENTION:
  # for some reason the e-mail is not being received by Gmail
  # it could be because of trash-email filtering from google.
  # However, the pasword reset URL sent can be retrieved from the
  # server logs.
  # These URLs for password reset work.

  # Allow mailer url inclusion
  config.action_mailer.default_url_options = { :host => "localhost:3000" }

  config.action_mailer.default_options = {
    from: "minghz42@gmail.com"
  }
  
  config.action_mailer.perform_deliveries = true
  
  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true

  # Deveopment specific mailing method. Lets use localhost for now
  config.action_mailer.delivery_method = :sendmail
    # Defaults to:
    # config.action_mailer.sendmail_settings = {
    #   location: '/usr/sbin/sendmail',
    #   arguments: '-i -t'
    # }
end
