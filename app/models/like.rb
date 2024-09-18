# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true, counter_cache: true

  # rubocop:disable Rails/HasManyOrHasOneDependent
  has_one :notification, as: :source
  # rubocop:enable Rails/HasManyOrHasOneDependent

  validates :user_id, uniqueness: { scope: %i[likeable_id likeable_type] }

  delegate :notification_user, to: :likeable

  after_create_commit :trigger_notification
  before_destroy :revert_notification_source

  def trigger_notification
    return if user.id == likeable.user_id

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

  def revert_notification_source
    prev_like = likeable.likes.where.not(id:).order(id: :desc).first
    return notification.destroy unless prev_like

    notification.update(source: prev_like)
  end
end
