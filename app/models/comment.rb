# frozen_string_literal: true

class Comment < ApplicationRecord
  include Likable
  include NotificationTarget

  has_rich_text :content

  belongs_to :user
  belongs_to :post, counter_cache: true

  has_one :notification, as: :source, dependent: :destroy

  validates :content, presence: true

  after_create_commit :trigger_notification

  delegate :email, :name, to: :user, prefix: :user

  private

  def trigger_notification
    return if user.id == post.user_id

    Notification.create(
      target: post,
      target_user: post.user,
      source: self,
    )
  end
end
