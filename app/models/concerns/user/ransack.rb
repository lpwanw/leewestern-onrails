# frozen_string_literal: true

module User::Ransack
  extend ActiveSupport::Concern

  included do
    def self.ransackable_attributes(_auth_object = nil)
      %w[name]
    end
  end
end
