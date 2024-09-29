# frozen_string_literal: true

if Rails.env.test?
  SimpleCov.start "rails" do
    add_group "Components", "app/components"
  end
end
