# frozen_string_literal: true

require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  describe "GET new" do
    subject { get :new, params: }

    let(:user) { create(:user) }
    let(:post) { create(:post) }
    let(:post_id) { post.id }
    let(:params) do
      {
        post_id:,
      }
    end

    before do
      sign_in user
    end

    context "when not found commentable" do
      let(:post_id) { "invalid_id" }

      before { subject }

      it { expect(flash[:error]).to eq I18n.t("Can not find commentable") }
    end

    context "when request turbo_frame" do
      before do
        request.headers["Turbo-Frame"] = :modal
        subject
      end

      it { expect(response).to have_http_status(:ok) }
    end

    context "when not request turbo_frame" do
      before do
        subject
      end

      it { expect(response).to have_http_status(:redirect) }
    end
  end
end
