# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

FactoryBot.create(
  :user,
  email: ENV.fetch("USER_EMAIL", nil),
  password: ENV.fetch("USER_PASSWORD", nil),
  password_confirmation: ENV.fetch("USER_PASSWORD", nil),
  confirmed_at: Time.current,
)

FactoryBot.create_list(:post, 10).each do |post|
  FactoryBot.create_list(:comment, 2, commentable: post)
  FactoryBot.create_list(:like, 10, likeable: post)
end
