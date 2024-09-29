# frozen_string_literal: true

require "rails_helper"

RSpec.describe NotificationsController, type: :controller do
  describe "Get like" do
    subject { get :like }

    let(:current_user) { create(:user) }

    before do
      sign_in current_user
      create_list(:post, 3, user: current_user).each do |post|
        create(:like, likeable: post)
      end
      subject
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to render_template(:index) }
    it { expect(controller.send(:load_more_path)).to eq like_notifications_path(format: :turbo_stream, page: 2) }
  end
end
