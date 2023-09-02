# frozen_string_literal: true

# The Product model.
class Product
  attr_accessor :imported, :kind, :name, :price

  def initialize(attributes = {})
    @imported = attributes.fetch(:imported, false)
    @kind = attributes[:kind]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def book?
    kind == 'book'
  end

  def food?
    kind == 'food'
  end

  def imported?
    imported
  end

  def medical?
    kind == 'medical'
  end
end
