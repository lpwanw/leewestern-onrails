# frozen_string_literal: true

class LikesController < ApplicationController
  include Post::Broadcast
  before_action :load_post, only: %i[update]

  def update
    @like = Like.find_or_initialize_by(user: current_user, post: @post)

    if @like.persisted?
      @like.delete
    else
      @like.save
    end

    broadcast_interact(@post, current_user.dup)
  end

  private

  def load_post
    @post = Post.find_by(id: params[:post_id])
  end
end
