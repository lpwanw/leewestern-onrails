# frozen_string_literal: true

require "rails_helper"

RSpec.describe Notification::Base, type: :component do
  subject { render_inline component }

  let(:component) { described_class.new notification }

  context "when like" do
    let(:notification) { create(:like).notification }

    before { subject }

    it { expect(component.send(:component)).to be_a(Notification::Like) }
  end

  context "when follow" do
    let(:notification) { create(:follow).notification }

    before { subject }

    it { expect(component.send(:component)).to be_a(Notification::Follow) }
  end

  context "when comment" do
    let(:notification) { create(:comment).notification }

    before { subject }

    it { expect(component.send(:component)).to be_a(Notification::Comment) }
  end
end
