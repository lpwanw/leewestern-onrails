# frozen_string_literal: true

module Navigation
  class Item < ViewComponent::Base
    ICONS = {
      home: "icon/home",
    }.freeze

    def initialize(icon)
      @icon = icon
      super
    end

    private

    attr_reader :icon

    def icon_svg
      ICONS[icon]
    end
  end
end
