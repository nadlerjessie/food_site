class RecipesController < ApplicationController
 
  def index
    @recipes = Recipe.all
  end

  def create
    binding.pry
    @recipe = Recipe.new(recipe_params)
    @recipe.proportions.each do | proportion |
      @recipe.ingredients.each do | ingredient |
        @recipe.units.each do | unit |
          @recipe.create_proportion(proportion, ingredient, unit)
        end
      end
    end
    binding.pry
  end

  def new 
    @recipe = Recipe.new
    @recipe.steps.build
    @recipe.proportions.build
    @recipe.ingredients.build
    @recipe.units.build
  end

  def show
    # @recipe = 
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :public_recipe, :step_ids => [], :steps_attributes =>[:description], :proportion_ids => [], :proportions_attributes => [:quantity], :ingredient_ids => [], :ingredients_attributes => [:name],:unit_ids => [], :units_attributes => [:name])
    end

    def proportion_params
      params.require(:recipe).permit(:porportion_ids => [], :ingredient_ids => [], :ingredients_attributes => [:name])
    end

end
