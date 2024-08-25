# frozen_string_literal: true

class Editor::Quote::Component < Editor::BaseComponent
  private

  def tag_name
    "blockquote"
  end

  def options
    {
      class: class_names,
    }
  end

  def class_names
    alignment_class = "text-center" if alignment == "center"
    [alignment_class]
  end

  def alignment
    @alignment ||= block.dig(:data, :alignment)
  end

  def caption
    @caption ||= block.dig(:data, :caption)
  end
end
