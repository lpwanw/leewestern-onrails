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

    context "when post_type is comment" do
      subject { build(:post, post_type: "comment") }

      it { is_expected.to validate_presence_of(:shared_post_id) }
    end

    context "when post_type is post" do
      subject { build(:post, post_type: "post") }

      it { is_expected.not_to validate_presence_of(:shared_post_id) }
    end
  end

  describe "Associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:shared_post).class_name("Post").optional(true) }
    it { is_expected.to have_many(:reposts).class_name("Post").inverse_of(:shared_post).dependent(:nullify) }
    it { is_expected.to have_many(:likes).dependent(:delete_all) }
  end

  describe "Enums" do
    it do
      expect(subject).to define_enum_for(:status)
        .with_values(draft: "draft", published: "published")
        .backed_by_column_of_type(:string)
    end

    it do
      expect(subject).to define_enum_for(:post_type)
        .with_values(post: "post", repost: "repost", comment: "comment")
        .backed_by_column_of_type(:string)
    end
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
end
