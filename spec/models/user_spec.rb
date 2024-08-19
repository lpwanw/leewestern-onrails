# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  describe "Associations" do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
  end
end
