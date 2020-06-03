require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'

class CookbookTest < Minitest::Test
  def setup
    @cookbook = Cookbook.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
  end

  def test_it_exists
    assert_instance_of Cookbook, @cookbook
  end

  def test_starts_with_no_recipes
    assert_equal [], @cookbook.recipes
  end

  def test_it_can_add_recipes
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    
    assert_equal [@recipe1, @recipe2], @cookbook.recipes
  end
end
