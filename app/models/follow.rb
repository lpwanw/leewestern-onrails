# frozen_string_literal: true

class Follow < ApplicationRecord
  include NotificationAction

  belongs_to :follower,
             class_name: "User",
             counter_cache: :following_count,
             inverse_of: :active_follows
  belongs_to :followed,
             class_name: "User",
             counter_cache: :followers_count,
             inverse_of: :passive_follows

  validates :follower_id, uniqueness: { scope: :followed_id }

  def notification_actor
    follower
  end

  def notification_target
    followed
  end

  def notification_user
    followed
  end
end
