# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.string :bio
      t.string :link

      t.timestamps
    end
  end
end
