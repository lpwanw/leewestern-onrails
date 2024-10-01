# frozen_string_literal: true

require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  describe "POST create" do
    subject { post :create, params:, format: :turbo_stream }

    let(:user) { create(:user) }
    let(:user_post) { create(:post) }
    let(:post_id) { user_post.id }
    let(:content) { "<div>content</div>" }
    let(:params) do
      {
        post_id:,
        comment: {
          content:,
        },
      }
    end

    before do
      sign_in user
    end

    context "when not found Post" do
      let(:post_id) { "invalid_id" }

      before { subject }

      it { expect(flash[:error]).to eq I18n.t("Can not find Post") }
    end

    context "when it response successful" do
      before { subject }

      it { expect(response).to have_http_status(:ok) }
      it { expect(flash[:success]).to eq I18n.t("Comment created") }
    end

    context "when it create comment" do
      it { expect { subject }.to change(Comment, :count).by(1) }
    end

    context "when it response error" do
      let(:content) { "" }

      before { subject }

      it { expect(response).to have_http_status(:ok) }
      it { expect(flash[:error]).to eq "Content can't be blank" }
    end
  end
end
