# frozen_string_literal: true

require "rails_helper"

RSpec.describe SearchController, type: :controller do
  describe "GET user" do
    subject { get :user, params: }

    let(:params) do
      {
        q: {
          "name_cont" => "UniqueName",
        },
      }
    end

    before do
      sign_in create(:user)
      subject
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to render_template(:user) }
    it { expect(controller.send(:user_params).to_h).to eq params[:q] }
  end
end
