# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true, counter_cache: true

  has_one :notification, as: :source, dependent: :destroy

  validates :user_id, uniqueness: { scope: %i[likeable_id likeable_type] }

  delegate :notification_user, to: :likeable

  after_create_commit :trigger_notification

  def trigger_notification
    notification = Notification.find_by(
      target: likeable,
      source_type: self.class.name,
    )

    Notification.transaction do
      notification&.delete

      create_notification(
        target: likeable,
        target_user: likeable.user,
      )
    end
  end
end
