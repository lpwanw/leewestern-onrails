# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post do
  describe "Validations" do
    subject { build(:post) }

    it { is_expected.to validate_length_of(:title).is_at_most(255) }

    context "when shared_post nil" do
      it { is_expected.to validate_presence_of(:title) }
    end

    context "when shared_post present" do
      subject { build(:post, shared_post:) }

      let(:shared_post) { create(:post) }

      it { is_expected.not_to validate_presence_of(:title) }
      it { is_expected.to validate_length_of(:title).is_at_most(255).allow_blank }
    end
  end

  describe "Associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:shared_post).class_name("Post").optional(true) }
    it { is_expected.to have_many(:reposts).class_name("Post").inverse_of(:shared_post).dependent(:nullify) }
  end
end
