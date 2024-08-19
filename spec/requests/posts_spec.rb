# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "GET index" do
    subject { get :index }

    let(:user) { create(:user) }
    let(:posts) { create_list(:post, 10) }

    before do
      sign_in user
      subject
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to render_template(:index) }
    it { expect(assigns[:posts]).to eq posts }
  end
end
