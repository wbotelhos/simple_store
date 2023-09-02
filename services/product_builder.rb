# frozen_string_literal: true

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

    Product.new(name: line[:name], kind: kind)
  end
end
