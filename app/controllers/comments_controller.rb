# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :load_post, only: %i[new create]

  helper_method :build_comment

  def new
    @comment = build_comment
  end

  def create
    @comment = build_comment
    @comment.assign_attributes(comment_params)

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
    params.required(:post).permit(:content)
  end

  def build_comment
    current_user.posts.build(post_type: :comment, shared_post_id: @post.id, status: :published)
  end
end
