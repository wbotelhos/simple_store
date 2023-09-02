# frozen_string_literal: true

# Class responsible to format the cart data to be presented to the final user.
class CartPresenter
  def initialize(data)
    @data = data
  end

  def line_items
    data.map do |item|
      product = item[:product]

      [
        item[:quantity],
        product.imported? ? 'imported' : nil,
        "#{product.name}:",
        format_number(item[:total]),
      ].compact.join(' ')
    end
  end

  def taxes
    format_number(data.sum { |item| item[:taxes] })
  end

  def total
    format_number(data.sum { |item| item[:total] })
  end

  private

  attr_reader :data

  def format_number(number)
    format('%.2f', number)
  end
end
