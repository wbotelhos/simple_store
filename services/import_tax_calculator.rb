# frozen_string_literal: true

# Module responsible to calculate the tax for imported products.
module ImportTaxCalculator
  module_function

  def call(product)
    return 0 unless product.imported?

    product.price * 5.0 / 100
  end
end
