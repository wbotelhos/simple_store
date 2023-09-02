# frozen_string_literal: true

require 'pry-byebug'
require 'rspec'

require_relative '../../services/product_calculator'

RSpec.describe PriceRounder, '.call' do
  it 'rounds up to the nearest 0.05 multiple value' do
    expect(PriceRounder.call(1.001)).to be(1.05)
    expect(PriceRounder.call(1.01)).to be(1.05)
    expect(PriceRounder.call(1.06)).to be(1.1)
  end
end
