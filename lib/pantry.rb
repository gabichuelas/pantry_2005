class Pantry
  attr_reader :stock
  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    @stock[ingredient] ||= 0
  end

  def restock(ingredient, qty)
    @stock[ingredient] ||= 0
    @stock[ingredient] += qty
  end
end
