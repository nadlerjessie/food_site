class RecipesController < ApplicationController
 
  def index
    @recipes = Recipe.all
  end

  def create
    binding.pry
    @recipe = Recipe.new(recipe_params)

  end

  def new 
    @recipe = Recipe.new
    3.times do 
      @recipe.steps.build
    end
  end

  def show
    # @recipe = 
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :public_recipe, :step_ids => [], :steps_attributes =>[:description])
    end

end
