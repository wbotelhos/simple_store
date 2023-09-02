# frozen_string_literal: true

require_relative 'line_converter'

# Module responsible to convert the input text to separated lines.
#
# From:
#
#     1 bottle of perfume at 18.99
# 1 packet of headache      pills at 9.75
#   3 imported boxes of chocolates at 11.25
#
# To:
#
# [
#  { imported: false, name: 'bottle of perfume', quantity: 1, price: 18.99 },
#  { imported: false, name: 'packet of headache pills', quantity: 1, price: 9.75 },
#  { imported: true, name: 'boxes of chocolates', quantity: 3, price: 11.25 },
# ]
module InputConverter
  module_function

  def call(input)
    input.split("\n").map do |line|
      LineConverter.call(line.split.join(' '))
    end
  end
end
