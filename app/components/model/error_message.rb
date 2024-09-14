# frozen_string_literal: true

class Model::ErrorMessage < ViewComponent::Base
  def initialize(record, attribute)
    @record = record
    @attribute = attribute
    super
  end

  private

  attr_reader :record, :attribute

  def error_message
    record.errors.full_messages_for(attribute).to_sentence
  end

  def error_message?
    record.errors.key?(attribute)
  end
end
