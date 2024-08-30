# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user
    title { FFaker::Lorem.sentence }
    body do
      {
        time: Time.current.to_i,
        blocks: [
          {
            id: SecureRandom.hex,
            type: "header",
            data: {
              text: FFaker::Lorem.sentences,
              level: 2,
            },
          },
          {
            id: SecureRandom.hex,
            type: "paragraph",
            data: {
              text: FFaker::Lorem.sentence,
            },
          },
          {
            id: SecureRandom.hex,
            type: "quote",
            data: {
              text: FFaker::Lorem.sentence,
              caption: "From noone",
            },
          }
        ],
        version: "2.30.5",
      }
    end
    shared_post { nil }
  end
end
