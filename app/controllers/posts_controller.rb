# frozen_string_literal: true

class PostsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @pagy, @posts = pagy(Post.includes(%i[user likes]))

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
