# frozen_string_literal: true

require 'pry-byebug'
require 'rspec'

require_relative '../../models/product'
require_relative '../../services/import_tax_calculator'

RSpec.describe ImportTaxCalculator, '.call' do
  it 'returns 5 percent for imported products' do
    product = Product.new(imported: true, name: 'any', price: 10.00)

    expect(ImportTaxCalculator.call(product)).to be(0.50)
  end

  it 'returns 0 percent for non imported products' do
    product = Product.new(imported: false, name: 'any', price: 10.00)

    expect(ImportTaxCalculator.call(product)).to be(0)
  end
end
