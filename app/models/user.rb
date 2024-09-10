# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :delete_all
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy
end
