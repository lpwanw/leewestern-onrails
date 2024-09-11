# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :load_likeable, only: %i[update]

  def update
    @like = Like.find_or_initialize_by(user: current_user, likeable: @likeable)

    if @like.persisted?
      @like.destroy
    else
      @like.save
    end
  end

  private

  def load_likeable
    @likeable = params[:post_id] ? Post.find_by(id: params[:post_id]) : Comment.find_by(id: params[:comment_id])
  end
end
