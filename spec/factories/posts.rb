# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user
    title { FFaker::Lorem.sentence }
    shared_post { nil }
    post_type { "post" }
    status { "published" }
  end
end
