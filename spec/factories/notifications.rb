# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    actor { nil }
    target { nil }
    action { "MyString" }
    read { false }
  end
end
