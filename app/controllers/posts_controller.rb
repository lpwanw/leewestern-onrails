# frozen_string_literal: true

class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :load_post, only: %i[show]
  before_action :load_current_user_post, only: %i[edit update]

  def index
    @pagy, @posts = pagy(Post.post.published.includes(%i[user likes]))

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = current_user.posts.new post_params

    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post.assign_attributes post_params
    if @post.save
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :content, :shared_post_id, :status)
  end

  def load_post
    @post = Post.post.accessible_by(current_user).find_by(id: params[:id])

    return if @post

    redirect_to root_path, flash: { error: I18n.t("Not found") }
  end

  def load_current_user_post
    @post = current_user.posts.find_by(id: params[:id])

    return if @post

    redirect_to root_path, flash: { error: I18n.t("Not found") }
  end
end
