# frozen_string_literal: true

# This migration comes from acts_as_taggable_on_engine (originally 3)
class AddTaggingsCounterCacheToTags < ActiveRecord::Migration[6.0]
  def self.up
    add_column ActsAsTaggableOn.tags_table, :taggings_count, :integer, default: 0

    say_with_time("Reset ActsAsTaggableOn::Tag") do
      ActsAsTaggableOn::Tag.reset_column_information
      ActsAsTaggableOn::Tag.find_each do |tag|
        ActsAsTaggableOn::Tag.reset_counters(tag.id, ActsAsTaggableOn.taggings_table)
      end
    end
  end

  def self.down
    remove_column ActsAsTaggableOn.tags_table, :taggings_count
  end
end
