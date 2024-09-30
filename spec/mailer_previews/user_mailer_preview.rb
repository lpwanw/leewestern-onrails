# frozen_string_literal: true

class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    user = FactoryBot.create(:user)
    Devise::Mailer.new.confirmation_instructions(user, "Unique Token")
  end
end
