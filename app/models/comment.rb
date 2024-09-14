# frozen_string_literal: true

class Comment < ApplicationRecord
  include Likable
  include NotificationAction
  include NotificationTarget

  has_rich_text :content

  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: true

  has_many :comments, as: :commentable, dependent: :destroy

  validates :content, presence: true

  delegate :email, to: :user, prefix: :user
  delegate :commentable, :is_a?, to: :commentable, prefix: :commentable

  def reply?
    commentable.is_a?(Comment)
  end

  def notification_user
    commentable.user
  end

  def notification_actor
    user
  end

  def notification_target
    commentable
  end
end
