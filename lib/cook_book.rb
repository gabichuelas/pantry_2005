class Cookbook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.reduce([]) do |ingredients, recipe|
      ingredients << recipe
  end

  def find_ingredient_names
    @recipes.find_all do |recipe|
      recipe.ingredients.map 
  end

  def highest_calorie_meal

  end
end
