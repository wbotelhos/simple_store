# frozen_string_literal: true

class Product
  attr_accessor :name, :kind

  def initialize(attributes = {})
    @name = attributes[:name]
    @kind = attributes[:kind]
  end

  def book?
    kind == 'book'
  end

  def food?
    kind == 'food'
  end

  def medical?
    kind == 'medical'
  end
end
