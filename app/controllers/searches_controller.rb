class SearchesController < ApplicationController
  skip_before_action :login_required
  def index
    user_logged_in = current_user
    recipe = params[:keyword]
    @recipes = Search.for(recipe, user_logged_in)
    if @recipes.size == 1
      recipe = @recipes.first
      redirect_to recipe_path(recipe)
    elsif @recipes.size == 0
      flash.now.notice = "Couldn't find any Recipes"
      render '/recipes'
    else
      render '/recipes'
    end
  end

end
