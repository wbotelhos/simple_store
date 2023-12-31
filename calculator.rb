# frozen_string_literal: true

require_relative 'components/cart_response'
require_relative 'services/input_converter'
require_relative 'services/product_calculator'

# Entry point module responsible to call the necessaries modules to calculate the product's price.
module Calculator
  module_function

  def call(input)
    InputConverter
      .call(input)
      .map(&ProductCalculator.method(:call))
      .then(&CartResponse.method(:call))
  end
end
