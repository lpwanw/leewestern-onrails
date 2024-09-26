# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment do
  describe "Associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :commentable }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:notifications).dependent(:destroy) }
  end

  describe "#reply?" do
    subject { comment.reply? }

    let(:comment) { create(:comment, commentable: )}

    context "when commentable is a Post" do
      let(:commentable) { create(:post) }

      it { is_expected.to be false }
    end

    context "when commentable is a Comment" do
      let(:commentable) { create(:comment) }

      it { is_expected.to be true }
    end
  end
end
