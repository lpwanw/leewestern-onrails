# frozen_string_literal: true

Sentry.init do |config|
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
  config.dsn = ENV.fetch("SENTRY_DSN", nil)
  config.enable_tracing = true
end
