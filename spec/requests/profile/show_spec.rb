# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProfileController, type: :controller do
  describe "GET show" do
    subject { get :show }

    let(:user) { create(:user) }

    before do
      sign_in user
      subject
    end

    it { expect(response).to have_http_status(:redirect) }
    it { expect(response).to redirect_to(user_path(user)) }
  end
end
