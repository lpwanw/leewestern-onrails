# frozen_string_literal: true

module Post::Broadcast
  extend ActiveSupport::Concern

  def broadcast_interact(post, current_user)
    Turbo::StreamsChannel.broadcast_replace_to(
      post,
      target: "interact_post_#{post.id}",
      partial: "posts/interact",
      locals: { post:, current_user: }
    )
  end

  def broadcast_comment(comment, current_user)
    Turbo::StreamsChannel.broadcast_prepend_to(
      comment.shared_post,
      target: "comments_post_#{comment.shared_post_id}",
      partial: "comments/comment",
      locals: { comment:, current_user: }
    )
  end
end
