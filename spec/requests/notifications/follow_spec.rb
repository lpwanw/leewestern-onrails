# frozen_string_literal: true

require "rails_helper"

RSpec.describe NotificationsController, type: :controller do
  describe "Get follow" do
    subject { get :follow }

    let(:current_user) { create(:user) }

    before do
      sign_in current_user
      create_list(:follow, 3, followed: current_user)
      subject
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to render_template(:index) }
    it { expect(controller.send(:load_more_path)).to eq follow_notifications_path(format: :turbo_stream, page: 2) }
  end
end
