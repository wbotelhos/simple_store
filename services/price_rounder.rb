# frozen_string_literal: true

module PriceRounder
  module_function

  def call(value, nonce: 20)
    (value * nonce).ceil.to_f / nonce
  end
end
