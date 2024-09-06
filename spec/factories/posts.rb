# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user
    title { FFaker::Lorem.sentence }
    shared_post { nil }
    content do
      header = "<h1>#{FFaker::Lorem.sentence}</h1>"
      content = Array.new(10) { "<div>#{FFaker::Lorem.paragraph}</div>" }.join
      body = "#{header}\n#{content}"
      ActionText::RichText.new(body:)
    end
    post_type { "post" }
    status { "published" }
  end
end
