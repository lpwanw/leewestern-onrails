# frozen_string_literal: true

module NavigationHelper
  def navigation_path(key)
    {
      home: root_path,
      add: new_post_path,
      user: user_path(current_user),
    }[key] || root_path
  end
end
