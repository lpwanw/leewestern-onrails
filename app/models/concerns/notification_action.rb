# frozen_string_literal: true

module NotificationAction
  extend ActiveSupport::Concern

  included do
    after_create_commit :create_notification
  end

  def create_notification
    return if notification_actor.id == notification_user.id

    Notification.create(
      actor: notification_actor,
      target: notification_target,
      target_user: notification_user,
      action: self.class.name.underscore,
    )
  end
end
