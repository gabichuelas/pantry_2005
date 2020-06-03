class Cookbook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.flat_map { |recipe| recipe.ingredient_names }.uniq
  end

  def calories_by_recipe
    @recipes.reduce({}) do |acc, recipe|
      acc[recipe] ||= 0
      acc[recipe] += recipe.total_calories
      acc
    end
  end

  def highest_calorie_meal
    calories_by_recipe.max_by { |recipe, calories| calories }[0]
  end

end
