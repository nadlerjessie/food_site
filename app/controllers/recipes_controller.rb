class RecipesController < ApplicationController
  skip_before_action :login_required, except: [:index]
  def index
    @recipes = Recipe.find_recipes(current_user)
  end

  def new
    @recipe = Recipe.new
    @recipe.steps.build
    @recipe.proportions.build
    @recipe.ingredients.build
    @recipe.units.build
  end

  def create
    binding.pry
    @recipe = Recipe.new(recipe_params)
    proportion_params['proportions_attributes'].each do | i, proportion |
      @ingredient = proportion_params['ingredients_attributes'][i]
      @unit = proportion_params['units_attributes'][i]
      @recipe.create_proportion(proportion, @ingredient, @unit)
    end

    @recipe.user = current_user

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_view_object = RecipeViewObject.new(@recipe)
    @proportions = @recipe.proportions.sort
    @steps = @recipe.steps.sort
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update_attributes(recipe_params)
    redirect_to recipe
  end

  private
  def recipe_params
      params.require(:recipe).permit(:name, :public_recipe, :step_ids => [], :steps_attributes =>[:description])
  end

  def proportion_params
     params.require(:recipe).permit(:porportion_ids => [], :proportions_attributes => [:quantity], :ingredient_ids => [], :ingredients_attributes => [:name], :unit_ids => [], :units_attributes => [:name])
  end

end
