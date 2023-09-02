# frozen_string_literal: true

require_relative '../presenters/cart_presenter'

# Module responsible to return the cart output.
# Fill free to replace this module to any other one to have different response, like a CartJsonResponse.
module CartResponse
  module_function

  def call(data)
    presenter = CartPresenter.new(data)

    <<~HEREDOC
      #{presenter.line_items.join("\n")}
      Sales Taxes: #{presenter.taxes}
      Total: #{presenter.total}
    HEREDOC
  end
end
