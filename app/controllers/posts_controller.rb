# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.includes([:user]))

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
