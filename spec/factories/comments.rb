# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    content do
      body = "<div>#{FFaker::Lorem.paragraph}</div>"
      ActionText::RichText.new(body:)
    end

    commentable factory: :post
  end
end
