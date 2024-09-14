# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.references :actor, null: false, foreign_key: { to_table: :users }
      t.references :target, polymorphic: true, null: false
      t.references :target_user, null: false, foreign_key: { to_table: :users }
      t.string :action
      t.boolean :read, default: false, null: false

      t.timestamps
    end
  end
end
