# frozen_string_literal: true

Rails.application.configure do
  config.good_job.enable_cron = true
  config.good_job.cleanup_preserved_jobs_before_seconds_ago = 1.hour

  save_my_self = if ENV.fetch("ON_RENDER", false)
                   {
                     cron: "*/1 * * * *",
                     class: "KeepMeAliveJob",
                     description: "Keep the service running on Render",
                   }
                 else
                   {}
                 end

  config.good_job.cron = {
    save_my_self:,
  }
end
