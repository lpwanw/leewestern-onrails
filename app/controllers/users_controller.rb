# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.post.accessible_by(current_user).includes(:likes).order(id: :desc)
  end
end
