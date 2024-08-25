# frozen_string_literal: true

class Editor::Header::Component < Editor::BaseComponent
  private

  def level
    @level ||= block.dig(:data, :level) || 2
  end

  def tag_name
    @tag_name ||= "h#{level}"
  end
end
