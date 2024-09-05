# frozen_string_literal: true

class Post < ApplicationRecord
  enum status: { draft: "draft", published: "published" }
  enum post_type: { post: "post", repost: "repost", comment: "comment" }

  has_rich_text :content

  belongs_to :user
  belongs_to :shared_post, class_name: "Post", optional: true

  has_many :reposts,
           -> { where(post_type: :repost) },
           class_name: "Post",
           foreign_key: "shared_post_id",
           inverse_of: :shared_post,
           dependent: :nullify

  has_many :comments,
           -> { where(post_type: :comment) },
           class_name: "Post",
           foreign_key: "shared_post_id",
           inverse_of: :shared_post,
           dependent: :nullify

  validates :shared_post_id, presence: true, unless: :post?

  has_many :likes, dependent: :delete_all
  has_many :liking_users, through: :likes, source: :user

  validates :title, presence: true, unless: :comment?
  validates :title, length: { maximum: 255 }, allow_blank: true

  validates :content, presence: true, unless: :repost?

  delegate :email, to: :user, prefix: true

  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end
end
