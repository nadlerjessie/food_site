class RecipesController < ApplicationController
  skip_before_action :login_required, except: [:index]
  def index
    @recipes = Recipe.find_recipes(current_user)
    @categories = Category.top_categories(10)
  end

  def new
    @recipe = Recipe.new
    @recipe.steps.build
    @proportion = @recipe.proportions.build
    @proportion.build_ingredient
    @proportion.build_unit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    if authorized_recipe_view?(@recipe)
      @recipe.view_count += 1
      @recipe.save
      @recipe_view_object = RecipeViewObject.new(@recipe)
      @proportions = @recipe.proportions.sort
      @steps = @recipe.steps.sort
    else
      redirect_to recipes_path
    end
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update_attributes(recipe_params)
    redirect_to recipe
  end

  def destroy
    Recipe.destroy(params['id'])
    redirect_to recipes_path
  end

  private
  def recipe_params
      params.require(:recipe).permit(:name, :public_recipe, :step_ids => [], :steps_attributes =>[:description], :porportion_ids => [], :proportions_attributes => [:recipe_id, :quantity, :ingredient_attributes => [:name], :unit_attributes => [:name]])
  end

  def authorized_recipe_view?(recipe)
    Recipe.find_recipes(current_user).include?(recipe)
  end
end
