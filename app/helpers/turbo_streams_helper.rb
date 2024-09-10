# frozen_string_literal: true

module TurboStreamsHelper
  def redirect_to(url)
    turbo_stream_action_tag(:redirect_to, url:)
  end
end

Turbo::Streams::TagBuilder.prepend(TurboStreamsHelper)
