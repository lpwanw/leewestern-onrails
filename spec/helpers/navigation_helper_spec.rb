# frozen_string_literal: true

require "rails_helper"

RSpec.describe NavigationHelper do
  describe "#navigation_path" do
    subject { helper.navigation_path(key) }

    let(:key) { :invalid_key }

    it { is_expected.to eq root_path }

    context "when key is home" do
      let(:key) { :home }

      it { is_expected.to eq root_path }
    end

    context "when key is add" do
      let(:key) { :add }

      it { is_expected.to eq new_post_path }
    end
  end
end
