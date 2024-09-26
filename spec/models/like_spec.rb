# frozen_string_literal: true

require "rails_helper"

RSpec.describe Like do
  describe "Associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:likeable) }
  end

  describe "Validations" do
    before { create(:like) }

    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(%i[likeable_id likeable_type]) }
  end

  describe "#trigger_notification" do
    let(:likeable) { create(:post) }
    let(:like) { build(:like, likeable:) }

    before { allow(like).to receive(:trigger_notification).and_call_original }

    it do
      like.save
      expect(like).to have_received(:trigger_notification)
    end

    it { expect { like.save }.to change(Notification, :count).by(1)}
  end

  describe "#revert_notification_source" do
    let!(:likeable) { create(:post) }
    let!(:prev_like) { create(:like, likeable:) }
    let!(:like) { create(:like, likeable:) }
    let!(:notification) { like.notification }

    before { like.destroy }

    it { expect(notification.reload.source).to eq prev_like }
  end
end
