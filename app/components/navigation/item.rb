# frozen_string_literal: true

class Navigation::Item < ViewComponent::Base
  ICONS = {
    home: "icon/home",
    add: "icon/add",
    more: "icon/more",
    sign_in: "icon/sign_in",
    user: "icon/user",
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
