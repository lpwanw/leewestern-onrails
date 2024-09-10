# frozen_string_literal: true

class CommentsController < ApplicationController
  include Post::Broadcast

  before_action :load_post, only: %i[new create]

  helper_method :build_comment

  def new
    @comment = current_user.comments.build
  end

  def create
    @comment = current_user.comments.build(comment_params.merge(commentable: @post))

    return unless @comment.save

    broadcast_comment(@comment, current_user)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to post_path(@post) }
    end
  end

  private

  def load_post
    @post = Post.find_by(id: params[:post_id])
  end

  def comment_params
    params.required(:comment).permit(:content)
  end
end
