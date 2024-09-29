# frozen_string_literal: true

require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  describe "GET show" do
    subject { get :show, params: }

    let(:user) { create(:user) }
    let(:id) { create(:comment, user: ).id }
    let(:params) do
      {
        id:,
      }
    end

    before do
      sign_in user
      subject
    end

    it { expect(response).to have_http_status(:ok) }

    context "when found comment" do
      it { expect(response).to render_template(:show) }
    end

    context "when notfound comment" do
      let(:id) { "invalid id" }

      it { expect(response).to render_template(:deleted_comment) }
    end
  end
end
