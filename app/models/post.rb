# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :shared_post, class_name: "Post", optional: true

  has_many :reposts, class_name: "Post",
                     foreign_key: "shared_post_id",
                     inverse_of: :shared_post,
                     dependent: :nullify

  has_many :likes, dependent: :delete_all
  has_many :liking_users, through: :likes, source: :user

  validates :title, presence: true, unless: :shared_post
  validates :title, length: { maximum: 255 }, allow_blank: true

  delegate :email, to: :user, prefix: true
end
