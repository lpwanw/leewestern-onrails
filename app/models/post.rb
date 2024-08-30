# frozen_string_literal: true

class Post < ApplicationRecord
  before_validation :standardize_body

  enum status: { draft: "draft", published: "published" }
  enum post_type: { post: "post", repost: "repost", comment: "comment" }

  belongs_to :user
  belongs_to :shared_post, class_name: "Post", optional: true

  has_many :reposts, class_name: "Post",
                     foreign_key: "shared_post_id",
                     inverse_of: :shared_post,
                     dependent: :nullify

  has_many :comments, class_name: "Post",
                      foreign_key: "shared_post_id",
                      inverse_of: :shared_post,
                      dependent: :nullify

  validates :shared_post_id, presence: true, unless: :post?

  has_many :likes, dependent: :delete_all
  has_many :liking_users, through: :likes, source: :user

  validates :title, presence: true, unless: :shared_post
  validates :title, length: { maximum: 255 }, allow_blank: true

  delegate :email, to: :user, prefix: true

  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end

  private

  def standardize_body
    return if body.instance_of?(Hash)

    self.body = JSON.parse(body || "{}")
  rescue JSON::ParserError
    errors.add(:body, :invalid)
  end
end
