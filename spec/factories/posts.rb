# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user
    title { FFaker::Lorem.sentence }
    body { {} }
    shared_post { nil }
  end
end
