# frozen_string_literal: true

module LineConverter
  module_function

  def call(line)
    match = line.match(/\A(\d)\s(imported\s)?(.+)\sat\s(\d+\.\d+)\z/)

    quantity, imported, name, price = match.captures

    {
      quantity: quantity.to_i,
      imported: !imported.nil?,
      name: name,
      price: price.to_f
    }
  end
end
