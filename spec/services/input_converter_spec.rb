require 'pry-byebug'
require 'rspec'

require_relative '../../services/input_converter'

RSpec.describe InputConverter, '.call' do
  it 'converts multiple lines of product' do
    input = <<~HEREDOC
      1 bottle of perfume at 18.99
      1 packet of headache pills at 9.75
      3 imported boxes of chocolates at 11.25
    HEREDOC

    result = InputConverter.call(input)

    expect(result).to eq(
      [
        { imported: false, product: 'bottle of perfume', quantity: 1, price: 18.99 },
        { imported: false, product: 'packet of headache pills', quantity: 1, price: 9.75 },
        { imported: true, product: 'boxes of chocolates', quantity: 3, price: 11.25 },
      ]
    )
  end

  it 'converts normalizes the input' do
    input = <<~HEREDOC
        1 bottle of perfume at 18.99
      1 packet of headache      pills at 9.75
        3 imported boxes of chocolates at 11.25
    HEREDOC

    result = InputConverter.call(input)

    expect(result).to eq(
      [
        { imported: false, product: 'bottle of perfume', quantity: 1, price: 18.99 },
        { imported: false, product: 'packet of headache pills', quantity: 1, price: 9.75 },
        { imported: true, product: 'boxes of chocolates', quantity: 3, price: 11.25 },
      ]
    )
  end
end
