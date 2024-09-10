# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    content do
      header = "<h1>#{FFaker::Lorem.sentence}</h1>"
      content = "<div>#{FFaker::Lorem.paragraph}</div>"
      body = "#{header}\n#{content}"
      ActionText::RichText.new(body:)
    end

    commentable factory: :post
  end
end
