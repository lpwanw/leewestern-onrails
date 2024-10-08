# frozen_string_literal: true

class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :load_post, only: %i[show]
  before_action :load_current_user_post, only: %i[edit update]

  def index
    @pagy, @posts = pagy(Post.includes(user: [:avatar_attachment])
                             .with_rich_text_content_and_embeds
                             .published.order(id: :desc))

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

    respond_to do |format|
      if @post.save
        flash[:success] = t("Post created successfully")
        respond_with_redirect(format)
      else
        flash[:error] = @post.errors.full_messages.join(", ")
        respond_with_error(format, :new)
      end
    end
  end

  def update
    @post.assign_attributes post_params
    respond_to do |format|
      if @post.save
        flash[:success] = t("Post updated successfully")
        respond_with_redirect(format)
      else
        flash[:error] = @post.errors.full_messages.join(", ")
        respond_with_error(format, :edit)
      end
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :content, :status, :tag_list)
  end

  def load_post
    @post = Post.accessible_by(current_user).includes(user: :avatar_attachment).find_by(id: params[:id])

    return if @post

    redirect_to posts_path, flash: { error: I18n.t("Not found") }
  end

  def load_current_user_post
    @post = current_user.posts.find_by(id: params[:id])

    return if @post

    redirect_to posts_path, flash: { error: I18n.t("Not found") }
  end

  def respond_with_redirect(format)
    format.html { redirect_to post_path(@post) }
    format.turbo_stream { turbo_redirect_to post_path(@post) }
  end

  def respond_with_error(format, action_name)
    format.html { render action_name, status: :unprocessable_entity }
    format.turbo_stream
  end
end
