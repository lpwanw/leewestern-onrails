# frozen_string_literal: true

class Post < ApplicationRecord
  include Post::Ransack
  include Likable
  include NotificationTarget

  enum status: { draft: "draft", published: "published" }

  has_rich_text :content
  acts_as_taggable_on :tags

  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { maximum: 255 }, allow_blank: true

  validates :content, presence: true

  delegate :email, :name, to: :user, prefix: true
  delegate :embeds, to: :content

  scope :accessible_by, (lambda do |user|
    where(user:).or(where(status: :published))
  end)

  def images
    embeds.select(&:image?)
  end
end
