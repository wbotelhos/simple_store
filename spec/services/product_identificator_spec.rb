# frozen_string_literal: true

require 'pry-byebug'
require 'rspec'

require_relative '../../services/product_identificator'
require_relative '../../models/product'

RSpec.describe ProductIdentificator, '.call' do
  it 'identifies book' do
    result = ProductIdentificator.call({ name: 'book' })

    expect(result).to eq(name: 'book', book: true, food: false, medical: false)
  end

  it 'identifies nothing' do
    result = ProductIdentificator.call({ name: 'music CD' })

    expect(result).to eq(name: 'music CD', book: false, food: false, medical: false)
  end

  it 'identifies food' do
    result = ProductIdentificator.call({ name: 'chocolate bar' })

    expect(result).to eq(name: 'chocolate bar', book: false, food: true, medical: false)
  end


  it 'identifies food' do
    result = ProductIdentificator.call({ name: 'box of chocolates' })

    expect(result).to eq(name: 'box of chocolates', book: false, food: true, medical: false)
  end

  it 'identifies nothing' do
    result = ProductIdentificator.call({ name: 'bottle of perfume' })

    expect(result).to eq(name: 'bottle of perfume', book: false, food: false, medical: false)
  end

  it 'identifies medical product' do
    result = ProductIdentificator.call({ name: 'headache pills' })

    expect(result).to eq(name: 'headache pills', book: false, food: false, medical: true)
  end

  it 'identifies food' do
    result = ProductIdentificator.call({ name: 'boxes of chocolates' })

    expect(result).to eq(name: 'boxes of chocolates', book: false, food: true, medical: false)
  end
end
