# frozen_string_literal: true

require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  describe "POST update" do
    subject { post :update, params: }

    let(:user) { create(:user) }
    let(:content) { "<div>content</div>" }
    let(:comment) { create(:comment, user:) }
    let(:id) { comment.id }
    let(:params) do
      {
        id:,
        comment: {
          content:,
        },
      }
    end

    before do
      sign_in user
    end

    context "when it response successful" do
      before { subject }

      it { expect(response).to have_http_status(:ok) }
    end

    context "when it response error" do
      let(:content) { "" }

      before { subject }

      it { expect(response).to have_http_status(:no_content) }
    end
  end
end
