# frozen_string_literal: true

require "rails_helper"

RSpec.describe LikesController, type: :controller do
  describe "GET /update" do
    subject { put :update, params: { post_id: } }

    let(:post) { create(:post) }
    let(:post_id) { post.id }
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    context "when it response" do
      before { subject }

      it { expect(response).to have_http_status(:no_content) }
    end

    context "when it create like" do
      it { expect { subject }.to change(Like, :count).by(1) }
    end

    context "when it destroy like" do
      before { create(:like, user:, post:) }

      it { expect { subject }.to change(Like, :count).by(-1) }
    end
  end
end
