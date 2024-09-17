# frozen_string_literal: true

class Notification::Base < ViewComponent::Base
  def initialize(notification)
    @notification = notification
    super
  end

  private

  attr_reader :notification

  delegate :source_type, :source, :target, to: :notification

  def component
    "Notification::#{source_type}".constantize.new notification
  end
end
