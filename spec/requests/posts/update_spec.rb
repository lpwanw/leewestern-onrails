# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "#update" do
    subject { patch :update, params:, format: }

    let(:format) { :html }

    let(:post) { create(:post, user:) }
    let(:id) { post.id }
    let(:title) { post.title }
    let(:user) { create(:user) }
    let(:params) do
      {
        post: {
          title:,
        },
        id:,
      }
    end

    before { sign_in user }

    context "when it update success" do
      let(:title) { FFaker::Lorem.sentence }

      before { subject }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:success]).to eq I18n.t("Post updated successfully") }
      it { expect(response).to redirect_to(post_path(post)) }
      it { expect(post.reload.title).to eq title }
    end

    context "when it failed to update" do
      let(:title) { "" }

      before { subject }

      it { expect(response).to have_http_status(:unprocessable_content) }
      it { expect(flash[:error]).to eq "Title can't be blank" }
      it { expect(response).to render_template(:edit) }
    end
  end
end
