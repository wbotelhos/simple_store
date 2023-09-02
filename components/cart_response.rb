# frozen_string_literal: true

require_relative '../presenters/cart_presenter'

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
