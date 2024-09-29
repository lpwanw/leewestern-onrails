# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "GET index" do
    subject { get :index }

    let(:posts) { create_list(:post, 2, status: :published) }

    before do
      subject
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to render_template(:index) }
    it { expect(assigns[:posts]).to eq posts.reverse }
  end

  describe "GET new" do
    subject { get :new }

    let(:user) { create(:user) }

    before do
      sign_in user
      subject
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to render_template(:new) }
    it { expect(assigns[:post]).to be_instance_of Post }
  end

  describe "POST create" do
    subject { post :create, params: }

    let(:user) { create(:user) }
    let(:params) do
      {
        post: {
          title:,
          content: "<h1>This is the content</h1>",
        },
      }
    end
    let(:title) { "Title" }

    before do
      sign_in user
    end

    context "when valid params" do
      let(:title) { "valid title" }
      let(:last_post) { Post.last }

      it { expect { subject }.to change(Post, :count).by(1) }

      context "when it response" do
        before { subject }

        it { expect(response).to have_http_status(:redirect) }
        it { expect(response).to redirect_to(post_path(last_post)) }
        it { expect(last_post.title).to eq title }
      end
    end

    context "when invalid params" do
      let(:title) { "" }

      it { expect { subject }.not_to change(Post, :count) }

      context "when it response" do
        before { subject }

        it { expect(response).to have_http_status(:unprocessable_content) }
        it { expect(response).to render_template(:new) }
        it { expect(assigns[:post]).to be_instance_of Post }
      end
    end
  end

  describe "GET show" do
    subject { get :show, params: }

    let(:params) do
      {
        id:,
      }
    end

    let(:post) { create(:post) }
    let(:id) { post.id }

    context "when response ok" do
      before { subject }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template(:show) }
    end

    context "when not found" do
      let(:id) { "invalid" }

      before { subject }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:error]).to eq I18n.t("Not found") }
      it { expect(response).to redirect_to(posts_path) }
    end
  end
end
