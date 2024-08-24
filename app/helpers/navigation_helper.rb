# frozen_string_literal: true

module NavigationHelper
  def navigation_path(key)
    {
      home: root_path,
      add: new_post_path,
    }[key] || root_path
  end
end
