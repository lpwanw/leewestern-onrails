# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user
    title { FFaker::Lorem.sentence }
    body do
      {
        time: 1_724_551_781_547,
        blocks: [
          {
            id: SecureRandom.hex,
            type: "paragraph",
            data: {
              text: FFaker::Lorem.sentence,
            },
          }
        ],
        version: "2.30.5",
      }
    end
    shared_post { nil }
  end
end
