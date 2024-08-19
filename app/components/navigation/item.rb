# frozen_string_literal: true

module Navigation
  class Item < ViewComponent::Base
    ICONS = {
      home: "icon/home",
    }.freeze

    def initialize(icon, html_options = {})
      @icon = icon
      @html_options = html_options
      super
    end

    private

    attr_reader :icon, :html_options

    def icon_svg
      ICONS[icon]
    end

    def class_options
      @class_options ||= html_options[:class] || ""
    end
  end
end
