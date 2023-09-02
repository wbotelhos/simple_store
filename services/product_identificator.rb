# frozen_string_literal: true

module ProductIdentificator
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

  def call(product)
    product.merge(
      book: match?(product, BOOKS),
      food: match?(product, FOODS),
      medical: match?(product, MEDICAL)
    )
  end

  private_class_method def match?(product, items)
    product[:name].split(' ').any? { |word| items.include?(word) }
  end
end
