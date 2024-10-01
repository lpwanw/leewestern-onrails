# frozen_string_literal: true

require "rails_helper"

RSpec.describe NotificationsController, type: :controller do
  describe "Get index" do
    subject { get :index }

    let(:current_user) { create(:user) }
    let(:post) { create(:post, user: current_user) }

    before do
      sign_in current_user
      create_list(:comment, 3, post:)
      subject
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to render_template(:index) }
    it { expect(controller.send(:load_more_path)).to eq notifications_path(format: :turbo_stream, page: 2) }
  end
end
