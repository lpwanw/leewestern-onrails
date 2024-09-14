# frozen_string_literal: true

class FollowsController < ApplicationController
  before_action :set_user

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
end
