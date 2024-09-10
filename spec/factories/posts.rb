# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user
    title { FFaker::Lorem.sentence }
    content do
      header = "<h1>#{FFaker::Lorem.sentence}</h1>"
      content = Array.new(10) { "<div>#{FFaker::Lorem.paragraph}</div>" }.join
      body = "#{header}\n#{content}"
      ActionText::RichText.new(body:)
    end
    status { "published" }
  end
end
