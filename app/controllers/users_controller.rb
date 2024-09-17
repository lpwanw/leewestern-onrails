# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :load_user, only: %i[show modal]

  def show
    @posts = @user.posts.accessible_by(current_user).order(id: :desc)
  end

  def modal; end

  private

  def load_user
    @user = User.find_by id: params[:id]
  end
end
