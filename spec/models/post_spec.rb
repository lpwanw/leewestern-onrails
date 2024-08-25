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
    it { is_expected.to have_many(:likes).dependent(:delete_all) }
  end

  describe "#liked_by?" do
    subject { post.liked_by?(user) }

    let(:post) { create(:post) }
    let(:user) { create(:user) }

    context "when liked by user" do
      before { create(:like, user:, post:) }

      it { is_expected.to be true }
    end

    context "when not liked by user" do
      it { is_expected.to be false }
    end
  end

  describe "#standardize_body" do
    subject { post.send(:standardize_body) }

    let(:post) { build(:post, body:) }

    before { subject }

    context "when valid json body" do
      let(:body) { "{}" }

      it { expect(post).to be_valid }
    end

    context "when invalid json body" do
      let(:body) { "invalid_json" }

      it { expect(post).not_to be_valid }
    end
  end
end
