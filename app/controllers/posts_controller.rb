# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
