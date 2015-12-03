class RecipesController < ApplicationController
 
  def index
    @recipes = Recipe.all
  end

  def new 
    @recipe = Recipe.new
    @recipe.steps.build
    @recipe.proportions.build
    @recipe.ingredients.build
    @recipe.units.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.proportions.each_with_index do | proportion, i |
      @ingredient = @recipe.ingredients[i]
      @unit = @recipe.units[i]
      @recipe.create_proportion(proportion, @ingredient, @unit)
    end
    @recipe.user = current_user
    @recipe.save
    redirect recipe_path(@recipe)
  end

  def show
    # @recipe = 
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :public_recipe, :step_ids => [], :steps_attributes =>[:description], :proportion_ids => [], :proportions_attributes => [:quantity], :ingredient_ids => [], :ingredients_attributes => [:name],:unit_ids => [], :units_attributes => [:name])
    end

end
