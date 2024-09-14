# frozen_string_literal: true

class Post < ApplicationRecord
  include Likable
  include NotificationTarget

  enum status: { draft: "draft", published: "published" }

  has_rich_text :content

  belongs_to :user

  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { maximum: 255 }, allow_blank: true

  validates :content, presence: true

  delegate :email, to: :user, prefix: true

  scope :accessible_by, (lambda do |user|
    where(user:).or(where(status: :published))
  end)

  def notification_user
    user
  end
end
