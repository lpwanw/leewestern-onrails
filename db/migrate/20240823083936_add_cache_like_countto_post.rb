# frozen_string_literal: true

class AddCacheLikeCounttoPost < ActiveRecord::Migration[7.1]
  def change
    add_columns :posts, :likes_count, type: :integer, default: 0, null: false
  end
end
