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

  def enough_ingredients_for?(recipe)
    recipe.ingredients.all? do |ingredient|
      stock_check(ingredient) >= recipe.ingredients_required[ingredient]
    end
  end
end
