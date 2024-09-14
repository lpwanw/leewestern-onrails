# frozen_string_literal: true

class Like < ApplicationRecord
  include NotificationAction

  belongs_to :user
  belongs_to :likeable, polymorphic: true, counter_cache: true

  validates :user_id, uniqueness: { scope: %i[likeable_id likeable_type] }

  delegate :notification_user, to: :likeable

  def notification_actor
    user
  end

  def notification_target
    likeable
  end
end
