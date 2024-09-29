# frozen_string_literal: true

require "rails_helper"

RSpec.describe Model::ErrorMessage, type: :component do
  subject { render_inline component }

  let(:component) { described_class.new record, attribute }
  let(:record) { Post.new }
  let(:attribute) { :title }

  before do
    record.valid?
    subject
  end

  it { expect(page).to have_text("Title can't be blank") }
end
