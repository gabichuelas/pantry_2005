class Ingredient
  attr_reader :name, :unit, :calories

  def initialize(detail_params)
    @name = detail_params[:name]
    @unit = detail_params[:unit]
    @calories = detail_params[:calories]
  end
end
