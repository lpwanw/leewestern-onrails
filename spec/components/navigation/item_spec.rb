# frozen_string_literal: true

require "rails_helper"

RSpec.describe Navigation::Item, type: :component do
  subject { render_inline component }

  let(:component) { described_class.new :home }

  before { subject }

  it { expect(component.send(:icon_svg)).to eq "icon/home.svg" }
end
