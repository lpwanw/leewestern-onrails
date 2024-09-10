# frozen_string_literal: true

module Post::Broadcast
  extend ActiveSupport::Concern

  def broadcast_comment(comment, current_user)
    Turbo::StreamsChannel.broadcast_prepend_to(
      broadcast_comment_stream_name(comment),
      target: broadcast_comment_target(comment),
      partial: broadcast_comment_partial(comment),
      locals: { comment:, current_user: },
    )
  end

  private

  def broadcast_comment_stream_name(comment)
    comment.commentable_is_a?(Post) ? comment.commentable : comment.commentable_commentable
  end

  def broadcast_comment_target(comment)
    "comments_#{comment.commentable_type.underscore}_#{comment.commentable_id}"
  end

  def broadcast_comment_partial(comment)
    comment.commentable_is_a?(Comment) ? "comments/comment_reply" : "comments/comment"
  end
end
