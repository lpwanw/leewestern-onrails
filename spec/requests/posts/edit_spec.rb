# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "#edit" do
    subject { get :edit, params: }

    let(:post) { create(:post, user:) }
    let(:id) { post.id }
    let(:user) { create(:user) }
    let(:params) do
      {
        id:,
      }
    end

    before { sign_in user }

    context "when it response ok" do
      before { subject }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template(:edit) }
    end

    context "when not found post" do
      let(:id) { "invalid" }

      before { subject }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:error]).to eq I18n.t("Not found") }
      it { expect(response).to redirect_to(posts_path) }
    end
  end
end
