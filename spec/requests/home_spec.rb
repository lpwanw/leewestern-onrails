# frozen_string_literal: true

require "rails_helper"

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    subject { get :index }

    context "when user not sign_in" do
      before { subject }

      it { expect(response).to have_http_status(:redirect) }
    end

    context "when user signed_in" do
      let(:user) { create(:user) }

      before do
        sign_in user
        subject
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template(:index) }
    end
  end
end
