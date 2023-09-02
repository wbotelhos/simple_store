# frozen_string_literal: true

require_relative 'line_converter'

module InputConverter
  module_function

  def call(input)
    input.split("\n").map do |line|
      LineConverter.call(line.split.join(' '))
    end
  end
end
