# frozen_string_literal: true

require "rails_helper"

RSpec.describe AppController, type: :controller do
  describe "Get App" do
    subject { get :index }

    before { subject }

    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to render_template(:index) }
  end
end
