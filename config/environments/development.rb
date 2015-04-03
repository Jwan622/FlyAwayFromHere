Rails.application.configure do
  config.cache_classes = false

  config.eager_load = false
  config.consider_all_requests_local       = true

  #why is caching even defaulted to false in the first place for development? How odd... What's the advantage?
  config.active_support.deprecation = :log
  Paperclip.options[:command_path] = "/usr/local/bin/"
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :test
  host = 'localhost:3000'
  config.action_mailer.default_url_options = { host: host }
  config.assets.digest = true
  config.assets.raise_runtime_errors = true

  # these are the configs for caching
  config.action_controller.perform_caching = true
  config.cache_store = :dalli_store
end
