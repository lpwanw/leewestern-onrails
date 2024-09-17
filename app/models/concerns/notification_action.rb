# frozen_string_literal: true

module NotificationAction
  extend ActiveSupport::Concern

  included do
    has_many :active_notifications, class_name: "Notification", as: :source, dependent: :destroy

    after_create_commit :create_notification
  end

  def create_notification
    return if notification_actor.id == notification_user.id

    Notification.create(
      target: notification_target,
      target_user: notification_user,
      source: self,
    )
  end
end
