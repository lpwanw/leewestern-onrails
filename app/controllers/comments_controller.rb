# frozen_string_literal: true

class CommentsController < ApplicationController
  include Post::Broadcast

  before_action :load_commentable, only: %i[new create]
  before_action :authenticate_turbo_frame, only: :new
  before_action :load_comment, only: %i[show edit update]
  helper_method :build_comment

  def show; end

  def new
    @comment = current_user.comments.build
  end

  def edit; end

  def create
    @comment = current_user.comments.build(comment_params.merge(commentable: @commentable))

    return unless @comment.save

    broadcast_comment(@comment, current_user)

    respond_to do |format|
      format.turbo_stream
    end
  end

  def update
    @comment = Comment.find(params[:id])

    return unless @comment.update(comment_params)

    render :show
  end

  private

  def load_commentable
    @commentable = params[:comment_id] ? Comment.find(params[:comment_id]) : Post.find(params[:post_id])
  end

  def comment_params
    params.required(:comment).permit(:content)
  end

  def authenticate_turbo_frame
    return if turbo_frame_request?

    redirect_to @commentable.is_a?(Comment) ? post_path(@commentable.commentable) : post_path(@commentable)
  end

  def load_comment
    @comment = Comment.find(params[:id])
  end
end
