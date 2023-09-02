# frozen_string_literal: true

require 'pry-byebug'
require 'rspec'

require_relative '../../services/product_calculator'

RSpec.describe ProductCalculator, '.call' do
  it 'calculates taxes and total based on the data product given' do
    data = {
      quantity: 3,
      imported: true,
      name: 'boxes of chocolates',
      price: 11.25
    }

    result = ProductCalculator.call(data)

    expect(result[:quantity]).to be(3)
    expect(result[:taxes]).to be(1.7999999999999998)
    expect(result[:total]).to be(35.55)

    product = result[:product]

    expect(product.name).to eq('boxes of chocolates')
    expect(product.price).to eq(11.25)
    expect(product.imported).to be(true)
  end
end
