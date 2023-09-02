# frozen_string_literal: true

require_relative '../models/product'

module ProductBuilder
  module_function

  BOOKS = %w[
    book
    books
  ].freeze

  FOODS = %w[
    chocolate
    chocolates
  ].freeze

  MEDICAL = %w[
    pill
    pills
  ].freeze

  def call(line)
    case line[:name]
    when /#{BOOKS.join('|')}/
      kind = 'book'
    when /#{FOODS.join('|')}/
      kind = 'food'
    when /#{MEDICAL.join('|')}/
      kind = 'medical'
    end

    Product.new(
      imported: line[:imported],
      kind: kind,
      name: line[:name],
      price: line[:price],
    )
  end
end
