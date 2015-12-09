class SearchesController < ApplicationController
  skip_before_action :login_required
  def index
    @categories = Category.top_categories(10)
    user_logged_in = current_user
    recipe = params[:keyword]
    @recipes = Search.for(recipe, user_logged_in)
    if @recipes.size == 1
      recipe = @recipes.first
      redirect_to recipe_path(recipe)
    elsif @recipes.size == 0
      flash.now.notice = "Couldn't find any Recipes"
      render '/recipes/index'
    else
      render '/recipes/index'
    end
  end

end
