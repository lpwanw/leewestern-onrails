# frozen_string_literal: true

module Likable
  extend ActiveSupport::Concern

  included do
    has_many :likes, as: :likeable, dependent: :destroy
    has_many :liking_users, through: :likes, source: :user

    def liked_by?(user)
      likes.exists?(user:)
    end
  end
end
