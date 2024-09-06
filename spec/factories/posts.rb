# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user
    title { FFaker::Lorem.sentence }
    shared_post { nil }
    content do
      body = "<h1>#{FFaker::Lorem.sentence}</h1><div>#{FFaker::Lorem.paragraph}</div>"
      ActionText::RichText.new(body:)
    end
    post_type { "post" }
    status { "published" }
  end
end
