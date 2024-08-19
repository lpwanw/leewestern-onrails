# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.json :body
      t.references :shared_post, foreign_key: { to_table: :posts }

      t.timestamps
    end
  end
end
