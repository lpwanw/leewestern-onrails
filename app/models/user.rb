# frozen_string_literal: true

class User < ApplicationRecord
  include User::Follow
  include User::Ransack
  include NotificationTarget

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :validatable, :trackable, :async

  has_one_attached :avatar

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :delete_all
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

  # notifications
  has_many :notifications, foreign_key: "target_user_id", dependent: :destroy, inverse_of: :target_user

  before_validation :init_name

  after_create_commit :create_profile

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 25 }, allow_blank: true
  validates :name, uniqueness: true
  validates :name, format: { with: /\A[a-zA-Z0-9._]+\z/ }

  validates :avatar, content_type: %i[png jpg jpeg],
                     size: { less_than: 100.megabytes }

  delegate :bio, :link, to: :profile

  def bio_added?
    bio.present?
  end

  def avatar_added?
    avatar.attached?
  end

  def remind_action_count
    count = 0
    %i[bio_added? avatar_added?].each do |action|
      count += 1 unless public_send(action)
    end

    count
  end

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
