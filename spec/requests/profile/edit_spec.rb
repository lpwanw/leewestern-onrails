# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProfileController, type: :controller do
  describe "GET edit" do
    subject { get :edit }

    let(:user) { create(:user) }

    context "when request turbo_frame" do
      before do
        sign_in user
        request.headers["Turbo-Frame"] = :modal
        subject
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template(:edit) }
      it { expect(controller.send(:turbo_frame_name)).to eq :modal }
    end

    context "when not request turbo_frame" do
      before do
        sign_in user
        subject
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to(user_path(user)) }
    end
  end
end
