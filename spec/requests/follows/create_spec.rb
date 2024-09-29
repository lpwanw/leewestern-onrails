# frozen_string_literal: true

require "rails_helper"

RSpec.describe FollowsController, type: :controller do
  describe "POST create" do
    subject { post :create, params: { id: }, format: :turbo_stream }

    let(:followed_user) { create(:user) }
    let(:current_user) { create(:user) }
    let(:id) { followed_user.id }

    before { sign_in current_user }

    context "when it create follow" do
      it { expect { subject }.to change(Follow, :count).by(1) }
    end
  end
end
