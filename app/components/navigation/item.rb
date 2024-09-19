# frozen_string_literal: true

class Navigation::Item < ViewComponent::Base
  ICONS = {
    home: "icon/home.svg",
    add: "icon/add.svg",
    more: "icon/more.svg",
    sign_in: "icon/sign_in.svg",
    user: "icon/user.svg",
    search: "icon/search.svg",
    notification: "icon/notification.svg",
  }.freeze

  ACTIVE_ICONS = {
    home: "icon/home_active.svg",
    add: "icon/add.svg",
    more: "icon/more.svg",
    sign_in: "icon/sign_in.svg",
    user: "icon/user.svg",
    search: "icon/search.svg",
    notification: "icon/notification_active.svg",
  }.freeze

  def initialize(icon, html_options = {}, active: false)
    @icon = icon
    @html_options = html_options
    @active = active
    super
  end

  private

  attr_reader :icon, :html_options, :active

  def icon_svg
    @active ? ACTIVE_ICONS[icon] : ICONS[icon]
  end

  def class_options
    @class_options ||= html_options[:class] || ""
  end
end
