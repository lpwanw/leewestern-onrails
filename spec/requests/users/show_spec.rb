# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "#show" do
    subject { get :show, params: { id: user.id } }

    let(:user) { create(:user) }

    before do
      sign_in user
      subject
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to render_template(:show) }
  end
end
