# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!
  helper_method :turbo_frame_name

  protected

  def turbo_redirect_to(url)
    render turbo_stream: turbo_stream.redirect_to(url)
  end

  def turbo_frame_name
    @turbo_frame_name ||= request.headers["Turbo-Frame"]
  end

  def authenticate_turbo_frame_request!
    return if turbo_frame_request?

    redirect_to posts_path
  end
end
