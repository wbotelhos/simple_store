# frozen_string_literal: true

require 'rspec'

require_relative '../../models/product'
require_relative '../../presenters/cart_presenter'

RSpec.describe CartPresenter do
  describe '#line_items' do
    it "returns the line items formatted" do
      data = [
        { product: Product.new(imported: true, name: 'one'), quantity: 1, total: 1.11 },
        { product: Product.new(imported: false, name: 'two'), quantity: 2, total: 2.22 },
        { product: Product.new(imported: true, name: 'three'), quantity: 3, total: 3.33 },
      ]

      expect(CartPresenter.new(data).line_items).to eq(
        [
          "1 imported one: 1.11",
          "2 two: 2.22",
          "3 imported three: 3.33",
        ]
      )
    end
  end

  describe '#taxes' do
    it "returns the sum of all products taxes" do
      data = [{ taxes: 1.11 }, { taxes: 2.22 }, { taxes: 3.33 }]

      expect(CartPresenter.new(data).taxes).to eq('6.66')
    end
  end

  describe '#total' do
    it "returns the sum of all products total" do
      data = [{ total: 1.11 }, { total: 2.22 }, { total: 3.33 }]

      expect(CartPresenter.new(data).total).to eq('6.66')
    end
  end
end
