# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "#show" do
    subject { get :modal, params: { id: user.id }, format: }

    let(:user) { create(:user) }
    let(:format) { :html }


    context "when format is html" do
      before do
        sign_in user
        subject
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to(posts_path) }
    end

    context "when request turbo frame" do
      before do
        sign_in user
        request.headers["Turbo-Frame"] = :modal
        subject
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template(:modal) }
    end
  end
end
