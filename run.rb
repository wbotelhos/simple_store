# frozen_string_literal: true

require_relative 'calculator'

input = $stdin

response = Calculator.call(input.readlines.join)

puts(response)
