# frozen_string_literal: true

module BasicTaxCalculator
  module_function

  def call(product)
    return 0 if product.book? || product.food? || product.medical?

    product.price * 10.0 / 100
  end
end
