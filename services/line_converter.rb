# frozen_string_literal: true

# Module responsible to convert each input line to an hash:
#
# From:
#
# 3 imported boxes of chocolates at 11.25
#
# To:
#
# { imported: true, name: 'boxes of chocolates', quantity: 3, price: 11.25 },
module LineConverter
  module_function

  def call(line)
    match = line.match(/\A(\d)\s(imported\s)?(.+)\sat\s(\d+\.\d+)\z/)

    quantity, imported, name, price = match.captures

    {
      quantity: quantity.to_i,
      imported: !imported.nil?,
      name: name,
      price: price.to_f,
    }
  end
end
