# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "GET index" do
    subject { get :index }

    let(:posts) { create_list(:post, 10) }

    before do
      subject
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to render_template(:index) }
    it { expect(assigns[:posts]).to eq posts }
  end
end
