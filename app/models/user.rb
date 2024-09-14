# frozen_string_literal: true

class User < ApplicationRecord
  include User::Follow

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one_attached :avatar

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :delete_all
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy

  # follow
  has_many :active_follows,
           class_name: "::Follow",
           foreign_key: :follower_id,
           dependent: :delete_all,
           inverse_of: :follower
  has_many :following, through: :active_follows, source: :followed

  has_many :passive_follows,
           class_name: "::Follow",
           foreign_key: :followed_id,
           dependent: :delete_all,
           inverse_of: :followed
  has_many :followers, through: :passive_follows, source: :follower

  before_validation :init_name

  after_create_commit :create_profile

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 25 }, allow_blank: true
  validates :name, uniqueness: true
  validates :name, format: { with: /\A[a-zA-Z0-9._]+\z/ }

  validates :avatar, content_type: %i[png jpg jpeg],
                     size: { less_than: 100.megabytes }

  delegate :bio, :link, to: :profile

  private

  def init_name
    return if name.present?

    base_name = email.split("@").first
    self.name = find_unique_name base_name
  end

  def find_unique_name(base_name)
    name = base_name
    counter = 1

    while User.exists?(name:)
      name = "#{base_name}#{counter}"
      counter += 1
    end

    name
  end
end
