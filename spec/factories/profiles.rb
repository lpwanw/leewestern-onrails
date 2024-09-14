# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    user { nil }
    bio { "MyString" }
    link { "MyString" }
    user_name { "MyString" }
  end
end
