# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :follower,
             class_name: "User",
             counter_cache: :following_count,
             inverse_of: :active_follows
  belongs_to :followed,
             class_name: "User",
             counter_cache: :followers_count,
             inverse_of: :passive_follows

  validates :follower_id, uniqueness: { scope: :followed_id }
end
