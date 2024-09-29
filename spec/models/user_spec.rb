# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  describe "Associations" do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:delete_all) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  describe "::Follow" do
    describe "#following?" do
      subject { user.following?(followed) }

      let(:user) { create(:user) }
      let(:followed) { create(:user) }

      context "when user follow followed" do
        before { user.follow(followed) }

        it { is_expected.to be true }
      end

      context "when user not follow followed" do
        it { is_expected.to be false }
      end
    end
  end

  describe "#bio_added?" do
    subject { user.bio_added? }

    let(:user) { create(:user) }

    context "when false" do
      it { is_expected.to be false }
    end

    context "when true" do
      before { user.profile.update(bio: FFaker::Lorem.sentence) }

      it { is_expected.to be true }
    end
  end

  describe "#avatar_added?" do
    subject { user.avatar_added? }

    let(:user) { create(:user) }

    context "when false" do
      it { is_expected.to be false }
    end
  end

  describe "#remind_action_count" do
    subject { user.remind_action_count }

    let(:user) { create(:user) }

    it { is_expected.to eq 2 }
  end

  describe "find_unique_name" do
    let(:user) { create(:user, email: "phuongtay@gmail.com") }

    before { create(:user, email: "phuongtay@yahoo.com") }

    it { expect(user.name).to eq "phuongtay1" }
  end
end
