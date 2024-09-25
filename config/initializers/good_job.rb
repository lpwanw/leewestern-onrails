# frozen_string_literal: true

Rails.application.configure do
  config.good_job.enable_cron = true
  config.good_job.cleanup_preserved_jobs_before_seconds_ago = 1.hour
  config.good_job.execution_mode = :async
end
