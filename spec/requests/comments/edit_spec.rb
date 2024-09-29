# frozen_string_literal: true

require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  describe "GET edit" do
    subject { get :edit, params: }

    let(:user) { create(:user) }
    let(:comment) { create(:comment, user:) }
    let(:id) { comment.id }
    let(:params) do
      {
        id:,
      }
    end

    before do
      sign_in user
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
