# frozen_string_literal: true

class CommentsController < ApplicationController
  include Post::Broadcast

  before_action :load_commentable, only: %i[new create]
  before_action :authenticate_turbo_frame, only: :new
  helper_method :build_comment

  def new
    @comment = current_user.comments.build
  end

  def create
    @comment = current_user.comments.build(comment_params.merge(commentable: @commentable))

    return unless @comment.save

    broadcast_comment(@comment, current_user)

    respond_to do |format|
      format.turbo_stream
    end
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
end
