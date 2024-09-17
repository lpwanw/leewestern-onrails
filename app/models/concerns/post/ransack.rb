# frozen_string_literal: true

module Post::Ransack
  extend ActiveSupport::Concern

  included do
    def self.ransackable_attributes(_)
      %w[title]
    end
  end
end
