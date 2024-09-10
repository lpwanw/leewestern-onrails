# frozen_string_literal: true

module ApplicationHelper
  def avatar_placeholder_url(user)
    "https://i.pravatar.cc/160?u=#{user.email}"
  end

  def render_turbo_flash_messages
    turbo_stream.prepend "toast-container", partial: "shared/toasts"
  end
end
