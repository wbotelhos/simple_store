# frozen_string_literal: true

require 'rspec'

require_relative '../../models/product'
require_relative '../../components/cart_response'

RSpec.describe CartResponse do
  it 'returns the cart response data' do
    data = [
        { product: Product.new(imported: true, name: 'one'), quantity: 1, taxes: 1.23, total: 1.11 },
        { product: Product.new(imported: false, name: 'two'), quantity: 2, taxes: 4.56, total: 2.22 },
        { product: Product.new(imported: true, name: 'three'), quantity: 3, taxes: 7.89, total: 3.33 },
      ]

    expect(CartResponse.call(data)).to eq(
      <<~HEREDOC
        1 imported one: 1.11
        2 two: 2.22
        3 imported three: 3.33
        Sales Taxes: 13.68
        Total: 6.66
      HEREDOC
    )
  end
end
