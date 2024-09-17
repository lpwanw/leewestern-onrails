# frozen_string_literal: true

class Comment < ApplicationRecord
  include Likable
  include NotificationTarget

  has_rich_text :content

  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: true

  has_many :comments, as: :commentable, dependent: :destroy

  validates :content, presence: true

  after_create_commit :create_notification

  delegate :email, to: :user, prefix: :user
  delegate :commentable, :is_a?, to: :commentable, prefix: :commentable

  def reply?
    commentable.is_a?(Comment)
  end

  private

  def create_notification
    Notification.create(
      target: commentable,
      target_user: commentable.user,
      source: self,
    )
  end
end
