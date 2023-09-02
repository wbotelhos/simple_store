# frozen_string_literal: true

class Product
  attr_accessor :imported, :kind, :name, :price

  def initialize(attributes = {})
    @name = attributes[:name]
    @kind = attributes[:kind]
    @imported = attributes.fetch(:imported, false)
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
