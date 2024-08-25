# frozen_string_literal: true

class Editor::Component < ViewComponent::Base
  def initialize(data)
    @data = data.with_indifferent_access
    super()
  end

  private

  attr_reader :data

  def component_blocks
    @component_blocks ||= blocks.map do |block|
      type = block[:type].camelcase
      block_kclass = "Editor::#{type}::Component".constantize
      block_kclass.new block
    rescue NameError
      Editor::BaseComponent.new block
    end
  end

  def blocks
    @blocks ||= @data[:blocks]
  end
end
