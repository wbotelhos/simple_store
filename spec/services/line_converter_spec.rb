# frozen_string_literal: true

require 'rspec'

require_relative '../../services/line_converter'

RSpec.describe LineConverter, '.call' do
  it 'splits the product line into attributes' do
    input = '2 book at 12.49'

    result = LineConverter.call(input)

    expect(result).to eq(imported: false, name: 'book', price: 12.49, quantity: 2)
  end

  it 'converts a product with more than one word name' do
    input = '1 chocolate bar at 0.85'

    result = LineConverter.call(input)

    expect(result).to eq(imported: false, name: 'chocolate bar', price: 0.85, quantity: 1)
  end

  it 'converts imported product' do
    input = '3 imported boxes of chocolates at 11.25'

    result = LineConverter.call(input)

    expect(result).to eq(imported: true, name: 'boxes of chocolates', price: 11.25, quantity: 3)
  end
end
