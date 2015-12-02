class SearchesController < ApplicationController
  skip_before_action :login_required
  def index
    recipe = params[:keyword]
    @recipes = Search.for(recipe)
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
