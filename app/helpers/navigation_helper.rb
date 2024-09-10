# frozen_string_literal: true

module NavigationHelper
  def navigation_path(key)
    {
      home: root_path,
      add: new_post_path,
      user: current_user.present? ? user_path(current_user) : new_user_session_path,
    }[key] || root_path
  end
end
