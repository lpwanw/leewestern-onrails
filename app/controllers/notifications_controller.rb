# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :update_read_notification

  helper_method :load_more_path

  def index
    @pagy, @notifications = pagy(query)
  end

  def follow
    @pagy, @notifications = pagy(query.follow)

    render :index
  end

  def like
    @pagy, @notifications = pagy(query.like)

    render :index
  end

  def comment
    @pagy, @notifications = pagy(query.comment)

    render :index
  end

  private

  def load_more_path
    case action_name
    when "like"
      like_notifications_path(format: :turbo_stream, page: pagy.next)
    when "comment"
      comment_notifications_path(format: :turbo_stream, page: pagy.next)
    when "follow"
      follow_notifications_path(format: :turbo_stream, page: pagy.next)
    else
      notifications_path(format: :turbo_stream, page: pagy.next)
    end
  end

  def query
    current_user.notifications
                .includes(:target, source: [:rich_text_content, { user: :avatar_attachment }])
                .order(id: :desc)
  end

  def update_read_notification
    current_user.update(read_notification: true)
  end
end
