require 'pry-byebug'
require 'rspec'

require_relative '../../services/line_converter'

RSpec.describe LineConverter, '.call' do
  it 'splits the product line into attributes' do
    input = '2 book at 12.49'

    result = LineConverter.call(input)

    expect(result).to eq(imported: false, product: 'book', quantity: 2, price: 12.49)
  end

  it 'converts a product with more than one word name' do
    input = '1 chocolate bar at 0.85'

    result = LineConverter.call(input)

    expect(result).to eq(imported: false, product: 'chocolate bar', quantity: 1, price: 0.85)
  end

  it 'converts imported product' do
    input = '3 imported boxes of chocolates at 11.25'

    result = LineConverter.call(input)

    expect(result).to eq(imported: true, product: 'boxes of chocolates', quantity: 3, price: 11.25)
  end
end
