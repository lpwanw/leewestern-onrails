# frozen_string_literal: true

module ApplicationHelper
  def avatar_tag(user, options = {})
    return image_tag("avatar.png", options.merge(alt: "User Avatar")) unless user.avatar.attached?

    if Rails.env.production?
      cl_image_tag user.avatar.key, width: 100, height: 100, crop: "scale", effect: "cartoonify"
    else
      image_tag user.avatar.variant(resize_to_limit: [100, 100, { crop: :centre }]), options.merge(alt: "User Avatar")
    end
  end

  def render_turbo_flash_messages
    turbo_stream.prepend "toast-container", partial: "shared/toasts"
  end
end
