# frozen_string_literal: true

require_relative '../models/product'

# Module responsible to discover the kind of each product.
# It can be book, food or medical product.
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

  def call(data)
    case data[:name]
    when /#{BOOKS.join('|')}/
      kind = 'book'
    when /#{FOODS.join('|')}/
      kind = 'food'
    when /#{MEDICAL.join('|')}/
      kind = 'medical'
    end

    Product.new(
      imported: data[:imported],
      kind: kind,
      name: data[:name],
      price: data[:price]
    )
  end
end
