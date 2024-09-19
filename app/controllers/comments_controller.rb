# frozen_string_literal: true

class CommentsController < ApplicationController
  include Post::Broadcast

  before_action :load_commentable, only: %i[new create]
  before_action :authenticate_turbo_frame_request!, only: :new
  before_action :load_comment, only: %i[show edit update destroy]

  def show; end

  def new
    @comment = current_user.comments.build
  end

  def edit; end

  def create
    @comment = current_user.comments.build(comment_params.merge(commentable: @commentable))

    if @comment.save
      flash[:success] = t("Comment created")
    else
      flash[:error] = @comment.errors.full_messages.join(", ")
    end
  end

  def update
    @comment = Comment.find(params[:id])

    return unless @comment.update(comment_params)

    render :show
  end

  def destroy
    @comment.destroy

    flash.now[:success] = t("Comment deleted")
  end

  private

  def load_commentable
    @commentable = params[:comment_id] ? Comment.find_by(id: params[:comment_id]) : Post.find_by(id: params[:post_id])

    return if @commentable

    flash[:error] = t("Can not find commentable")
    render turbo_stream: turbo_stream.redirect_to(posts_path)
  end

  def comment_params
    params.required(:comment).permit(:content)
  end

  def load_comment
    @comment = current_user.comments.find_by(id: params[:id])

    return if @comment

    render :deleted_comment
  end
end
