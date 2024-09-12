# frozen_string_literal: true

class Comment < ApplicationRecord
  include Likable

  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: true

  has_many :comments, as: :commentable, dependent: :destroy

  has_rich_text :content

  delegate :email, to: :user, prefix: :user
  delegate :commentable, :is_a?, to: :commentable, prefix: :commentable

  validates :content, presence: true

  def reply?
    commentable.is_a?(Comment)
  end
end
