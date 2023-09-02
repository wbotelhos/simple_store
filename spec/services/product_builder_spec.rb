# frozen_string_literal: true

require 'pry-byebug'
require 'rspec'

require_relative '../../services/product_builder'
require_relative '../../models/product'

RSpec.describe ProductBuilder, '.call' do
  it 'identifies book' do
    product = ProductBuilder.call({ name: 'book' })

    expect(product.name).to eq('book')
    expect(product.kind).to eq('book')
  end

  it 'identifies nothing' do
    product = ProductBuilder.call({ name: 'music CD' })

    expect(product.name).to eq('music CD')
    expect(product.kind).to be(nil)
  end

  it 'identifies food' do
    product = ProductBuilder.call({ name: 'chocolate bar' })

    expect(product.name).to eq('chocolate bar')
    expect(product.kind).to eq('food')
  end


  it 'identifies food' do
    product = ProductBuilder.call({ name: 'box of chocolates' })

    expect(product.name).to eq('box of chocolates')
    expect(product.kind).to eq('food')
  end

  it 'identifies nothing' do
    product = ProductBuilder.call({ name: 'bottle of perfume' })

    expect(product.name).to eq('bottle of perfume')
    expect(product.kind).to be(nil)
  end

  it 'identifies medical product' do
    product = ProductBuilder.call({ name: 'headache pills' })

    expect(product.name).to eq('headache pills')
    expect(product.kind).to eq('medical')
  end

  it 'identifies food' do
    product = ProductBuilder.call({ name: 'boxes of chocolates' })

    expect(product.name).to eq('boxes of chocolates')
    expect(product.kind).to eq('food')
  end
end
