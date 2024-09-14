# frozen_string_literal: true

module NotificationTarget
  extend ActiveSupport::Concern

  included do
    has_many :notifications, as: :target, dependent: :destroy
  end
end
