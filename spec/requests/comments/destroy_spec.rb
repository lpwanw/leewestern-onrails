# frozen_string_literal: true

require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  describe "DELETE destroy" do
    subject { delete :destroy, params:, format: :turbo_stream }

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
      subject
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to render_template(:destroy) }
    it { expect(flash[:success]).to eq I18n.t("Comment deleted") }
  end
end
