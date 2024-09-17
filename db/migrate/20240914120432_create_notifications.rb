# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.references :target, polymorphic: true, null: false
      t.references :source, polymorphic: true, null: false
      t.references :target_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
