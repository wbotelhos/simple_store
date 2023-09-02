# frozen_string_literal: true

require 'pry-byebug'
require 'rspec'

require_relative '../../models/product'
require_relative '../../services/basic_tax_calculator'

RSpec.describe BasicTaxCalculator, '.basic' do
  it 'return zero for books' do
    product = Product.new(kind: 'book', name: 'any', price: 10.00)

    expect(BasicTaxCalculator.call(product)).to be(0)
  end

  it 'return zero for books' do
    product = Product.new(kind: 'food', name: 'any', price: 10.00)

    expect(BasicTaxCalculator.call(product)).to be(0)
  end

  it 'return zero for medical products' do
    product = Product.new(kind: 'medical', name: 'any', price: 10.00)

    expect(BasicTaxCalculator.call(product)).to be(0)
  end

  it 'returns 10 percent of other products' do
    product = Product.new(kind: nil, name: 'any', price: 10.00)

    expect(BasicTaxCalculator.call(product)).to be(1.00)
  end
end
