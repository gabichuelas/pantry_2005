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

  def total_calories
    @ingredients.reduce(0) do |calories, ingredient|
      calories += ingredient.calories * @ingredients_required[ingredient]
    end
  end

  def ingredient_names
    @ingredients.map do |ingredient|
      ingredient.name
    end
  end

  def ingredient_details
    @ingredients.reduce([]) do |acc, ingredient|
      hash = {
        :ingredient => ingredient.name,
        :amount => "#{@ingredients_required[ingredient]} #{ingredient.unit}"
      }
      acc << hash
      acc
    end
  end

end
