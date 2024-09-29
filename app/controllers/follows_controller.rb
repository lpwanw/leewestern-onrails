# frozen_string_literal: true

class FollowsController < ApplicationController
  before_action :set_user
  before_action :authenticate_turbo_frame_request!, only: :confirm_unfollow

  def create
    current_user.follow(@user)
  end

  def destroy
    current_user.unfollow(@user)
  end

  def confirm_unfollow; end

  private

  def set_user
    @user = User.find(params[:followed_id] || params[:id])
  end

  def authenticate_turbo_frame_request!
    return if turbo_frame_request?

    redirect_to user_path(@user)
  end
end
