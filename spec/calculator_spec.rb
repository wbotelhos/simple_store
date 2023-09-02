# frozen_string_literal: true

require 'pry-byebug'
require 'rspec'

require_relative '../calculator'

RSpec.describe Calculator, '.call' do
  it 'calculates correctly the input 1' do
    input = <<~HEREDOC
      2 book at 12.49
      1 music CD at 14.99
      1 chocolate bar at 0.85
    HEREDOC

    expected = <<~HEREDOC
      2 book: 24.98
      1 music CD: 16.49
      1 chocolate bar: 0.85
      Sales Taxes: 1.50
      Total: 42.32
    HEREDOC

    expect(Calculator.call(input)).to eq(expected)
  end

  it 'calculates correctly the input 2' do
    input = <<~HEREDOC
      1 imported box of chocolates at 10.00
      1 imported bottle of perfume at 47.50
    HEREDOC

    expected = <<~HEREDOC
      1 imported box of chocolates: 10.50
      1 imported bottle of perfume: 54.65
      Sales Taxes: 7.65
      Total: 65.15
    HEREDOC

    expect(Calculator.call(input)).to eq(expected)
  end

  it 'calculates correctly the input 3' do
    input = <<~HEREDOC
      1 imported bottle of perfume at 27.99
      1 bottle of perfume at 18.99
      1 packet of headache pills at 9.75
      3 imported boxes of chocolates at 11.25
    HEREDOC

    expected = <<~HEREDOC
      1 imported bottle of perfume: 32.19
      1 bottle of perfume: 20.89
      1 packet of headache pills: 9.75
      3 imported boxes of chocolates: 35.55
      Sales Taxes: 7.90
      Total: 98.38
    HEREDOC

    expect(Calculator.call(input)).to eq(expected)
  end
end
