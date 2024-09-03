# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :status, default: "draft"
      t.integer :likes_count, default: 0, null: false
      t.string :post_type, default: "post", null: false
      t.references :shared_post, foreign_key: { to_table: :posts }

      t.timestamps
    end
  end
end
