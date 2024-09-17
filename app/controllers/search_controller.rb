# frozen_string_literal: true

class SearchController < ApplicationController
  skip_before_action :authenticate_user!

  def user
    @users = User.includes(:avatar_attachment)
  end

  def post
    @posts = Post.includes(user: :avatar_attachment)
  end
end
