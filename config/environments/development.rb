Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  CarrierWave.configure do|config|
    config.fog_credentials = {
     provider:              'AWS',
     aws_access_key_id:     'AKIAJ2KXSX5FBC4LX6FQ',
     aws_secret_access_key: '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',
     region:                'sa-east-1',
     path_style: true
    }
    config.fog_directory = 'entherm'
    config.fog_public = 'false' #WTF?
    config.fog_attributes = {'Cache-Control' => "max-age=#{365.to_i}" }
  end
end
