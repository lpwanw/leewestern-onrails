# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post do
  describe "Validations" do
    subject { build(:post) }

    it { is_expected.to validate_length_of(:title).is_at_most(255) }

    context "when shared_post nil" do
      it { is_expected.to validate_presence_of(:title) }
    end
  end

  describe "Associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  describe "Enums" do
    it do
      expect(subject).to define_enum_for(:status)
        .with_values(draft: "draft", published: "published")
        .backed_by_column_of_type(:string)
    end
  end

  describe "#liked_by?" do
    subject { post.liked_by?(user) }

    let(:post) { create(:post) }
    let(:user) { create(:user) }

    context "when liked by user" do
      before { create(:like, user:, likeable: post) }

      it { is_expected.to be true }
    end

    context "when not liked by user" do
      it { is_expected.to be false }
    end
  end
end
