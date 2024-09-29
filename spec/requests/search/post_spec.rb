# frozen_string_literal: true

require "rails_helper"

RSpec.describe SearchController, type: :controller do
  describe "GET post" do
    subject { get :post, params: }

    let!(:post) { create(:post, title: "UniqueTitle", status: :published) }
    let(:params) do
      {
        q: { "title_cont" => "UniqueTitle" },
      }
    end

    before do
      sign_in create(:user)
      subject
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to render_template(:post) }
    it { expect(assigns[:posts]).to include(post) }
    it { expect(controller.send(:post_params).to_h).to eq params[:q] }
  end
end
