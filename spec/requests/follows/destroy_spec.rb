# frozen_string_literal: true

require "rails_helper"

RSpec.describe FollowsController, type: :controller do
  describe "DELETE destroy" do
    subject { delete :destroy, params: { id: }, format: :turbo_stream }

    let(:followed_user) { create(:user) }
    let(:current_user) { create(:user) }
    let(:id) { followed_user.id }

    before do
      current_user.follow(followed_user)
      sign_in current_user
    end

    context "when it destroy follow" do
      it { expect { subject }.to change(Follow, :count).by(-1) }
    end
  end
end
