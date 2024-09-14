# frozen_string_literal: true

class User < ApplicationRecord
  include User::Follow

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :validatable, :trackable

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
end
