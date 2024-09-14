# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  validates :bio, length: { minimum: 3, maximum: 255 }, allow_blank: true

  validates :link, url: true, allow_blank: true
  validates :link, length: { maximum: 255 }, allow_blank: true

  delegate :email, to: :user

  accepts_nested_attributes_for :user, update_only: true
end
