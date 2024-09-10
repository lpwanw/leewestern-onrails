# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!

  protected

  def turbo_redirect_to(url)
    render turbo_stream: turbo_stream.redirect_to(url)
  end
end
