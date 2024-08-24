# frozen_string_literal: true

class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @pagy, @posts = pagy(Post.includes(%i[user likes]))

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new post_params

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :body, :shared_post_id)
  end
end
