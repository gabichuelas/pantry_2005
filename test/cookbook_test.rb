require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'
require './lib/pantry'

class CookbookTest < Minitest::Test
  def setup
    @cookbook = Cookbook.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")

    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)

    @pantry = Pantry.new
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

  def test_has_ingredients
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    assert_equal [@recipe1, @recipe2], @cookbook.recipes

    assert_equal ["Cheese", "Macaroni", "Ground Beef", "Bun"], @cookbook.ingredients
  end

  def test_calories_by_recipe
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    # require "pry"; binding.pry
    assert_instance_of Hash, @cookbook.calories_by_recipe
    assert_equal 440, @cookbook.calories_by_recipe[@recipe1]
  end

  def test_highest_calorie_meal
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    assert_equal [@recipe1, @recipe2], @cookbook.recipes

    assert_equal @recipe2, @cookbook.highest_calorie_meal
  end

  def test_has_a_creation_date
    assert_equal "04-22-2020", @cookbook.date
  end

  def test_has_a_summary
    expected = [{
      :name=>"Mac and Cheese",
      :details=>{
        :ingredients=>[
          {
            :ingredient=>"Macaroni",
            :amount=>"8 oz"
          },
          {
            :ingredient=>"Cheese",
            :amount=>"2 C"
          }
        ],
        :total_calories=>440
      }
    }, {
      :name=>"Burger",
      :details=>{
        :ingredients=>[
          {
            :ingredient=>"Ground Beef", :amount=>"4 oz"
          },
          {
            :ingredient=>"Bun",
            :amount=>"100 g"
          }
        ],
        :total_calories=>500
      }
    }]

    assert_equal expected, @cookbook.summary
  end

end
