# frozen_string_literal: true

require_relative 'basic_tax_calculator'
require_relative 'import_tax_calculator'
require_relative 'price_rounder'
require_relative 'product_builder'

# Module resopnsible to calculate the taxes and the total for each product.
module ProductCalculator
  module_function

  def call(data)
    product = ProductBuilder.call(data)
    basic_tax = BasicTaxCalculator.call(product)
    import_tax = ImportTaxCalculator.call(product)

    quantity = data[:quantity]
    taxes = quantity * PriceRounder.call(basic_tax + import_tax)
    total = (quantity * product.price) + taxes

    {
      product: product,
      quantity: quantity,
      taxes: taxes,
      total: total,
    }
  end
end
