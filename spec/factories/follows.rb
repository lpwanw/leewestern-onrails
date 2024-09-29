# frozen_string_literal: true

FactoryBot.define do
  factory :follow do
    follower factory: :user
    followed factory: :user
  end
end
