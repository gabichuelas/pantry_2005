class Recipe
  attr_reader :name, :ingredients_required, :ingredients

  def initialize(name)
    @name = name
    @ingredients_required = {}
    @ingredients = []
  end

  def add_ingredient(ingredient, qty)
    @ingredients_required[ingredient] ||= 0
    @ingredients_required[ingredient] += qty
    @ingredients << ingredient unless @ingredients.include?(ingredient)
  end

end
