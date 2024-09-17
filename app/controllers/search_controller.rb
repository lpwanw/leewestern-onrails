# frozen_string_literal: true

class SearchController < ApplicationController
  skip_before_action :authenticate_user!

  helper_method :user_params, :post_params

  def user
    @q = User.ransack(params[:q])
    @pagy, @users = pagy @q.result.includes(:avatar_attachment)
  end

  def post
    @q = Post.ransack(params[:q])
    @pagy, @posts = pagy @q.result.includes(user: :avatar_attachment)
  end

  private

  def user_params
    params.fetch(:q, {}).permit(:name_cont)
  end

  def post_params
    params.fetch(:q, {}).permit(:title_cont)
  end
end
