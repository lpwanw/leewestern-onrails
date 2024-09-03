# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :load_post, only: %i[new create]

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    return unless @comment.save

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
