# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  describe "Associations" do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:delete_all) }
  end
end
