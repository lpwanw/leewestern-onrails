# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  before_action :attache_logo

  private

  def attache_logo
    attachments["logo.png"] = File.read(Rails.root.join("app/assets/images/logo_small.png").to_s)
  end
end
