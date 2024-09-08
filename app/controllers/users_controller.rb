# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :load_user, only: %i[show modal]

  def show
    @posts = @user.posts.post.accessible_by(current_user).includes(:likes).order(id: :desc)
  end

  def modal; end

  private

  def load_user
    @user = User.find(params[:id])
  end
end
