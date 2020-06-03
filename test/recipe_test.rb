require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @recipe1 = Recipe.new("Mac and Cheese")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe1
  end

  def test_starts_with_no_ingredients_required
    assert_equal ({}), @recipe1.ingredients_required
  end
end
