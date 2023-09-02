# frozen_string_literal: true

# Module responsible to round up the number to the nearest multiple of 0.05.
#
# Examples:
#
# 1.001 -> 1.05
# 1.01 -> 1.05
# 1.06 -> 1.1
#
# Reference: https://www.seancdavis.com/posts/round-to-the-nearest-05-in-ruby/
module PriceRounder
  module_function

  def call(value, nonce: 20)
    (value * nonce).ceil.to_f / nonce
  end
end
