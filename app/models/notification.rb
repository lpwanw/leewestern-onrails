# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :target, polymorphic: true
  belongs_to :source, polymorphic: true
  belongs_to :target_user, class_name: "User"

  after_create_commit :broadcast_notification

  scope :comment, -> { where(source_type: "Comment") }
  scope :like, -> { where(source_type: "Like") }
  scope :follow, -> { where(source_type: "Follow") }

  private

  def stream_name
    "user_#{target_user_id}"
  end

  def broadcast_notification
    target_user.update(read_notification: false)
    broadcast_action_later_to stream_name,
                              action: :replace,
                              target: "notification-alert",
                              partial: "notifications/unread"
  end
end
