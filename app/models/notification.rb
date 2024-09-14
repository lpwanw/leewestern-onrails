# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :actor, class_name: "User"
  belongs_to :target, polymorphic: true
  belongs_to :target_user, class_name: "User"

  enum action: {
    comment: "comment",
    like: "like",
    follow: "follow",
  }

  after_create_commit :broadcast_notification

  scope :unread, -> { where(read: false) }

  private

  def stream_name
    "user_#{target_user_id}"
  end

  def broadcast_notification
    broadcast_action_later_to stream_name,
                              action: :replace,
                              target: "notification-alert",
                              partial: "notifications/unread"
  end
end
