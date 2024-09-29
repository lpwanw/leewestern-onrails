# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProfileController, type: :controller do
  describe "PUT update" do
    subject { put :update, params: }

    let(:user) { create(:user) }
    let(:params) do
      {
        profile: {
          user_attributes: {
            name:,
          },
        },
      }
    end
    let(:name) { "unique_user_name" }

    before do
      sign_in user
      subject
    end

    context "when update success full" do
      it { expect(response).to have_http_status(:ok) }
      it { expect(user.reload.name).to eq name }
      it { expect(flash[:success]).to eq I18n.t("Updated") }
    end

    context "when update failed" do
      let(:name) { "a b c @ &" }

      it { expect(response).to have_http_status(:unprocessable_content) }
      it { expect(response).to render_template(:edit) }
    end
  end
end
