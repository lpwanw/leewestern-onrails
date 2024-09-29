# frozen_string_literal: true

require "rails_helper"

RSpec.describe FollowsController, type: :controller do
  describe "GET confirm_unfollow" do
    subject { get :confirm_unfollow, params: { id: } }

    let(:followed_user) { create(:user) }
    let(:current_user) { create(:user) }
    let(:id) { followed_user.id }

    before { sign_in current_user }

    context "when it get turbo_frame" do
      before do
        request.headers["Turbo-Frame"] = :modal
        subject
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template(:confirm_unfollow) }
    end

    context "when it not full html" do
      before do
        subject
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to(user_path(followed_user)) }
    end
  end
end
