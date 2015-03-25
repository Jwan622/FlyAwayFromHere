Rails.application.configure do

  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'
  config.assets.compile = true
  config.assets.js_compressor = :uglifier
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.digest = true
  config.log_level = :debug
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new

  # for caching in production
  # config.cache_store = :dalli_store
  # config.action_controller.perform_caching = true

  config.active_record.dump_schema_after_migration = false

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  host = 'flyawayfromhere.herokuapp.com'
  config.action_mailer.default_url_options = { host: host }
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => Figaro.env.sendgrid_username,
    :password       => Figaro.env.sendgrid_password,
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
  }
end
