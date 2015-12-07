class FavoritesController < ApplicationController
 
  def create
    user = current_user
    recipe = Recipe.find(params[:recipe_id])
    if favorited?(user, recipe)
      favorite = Favorite.find_by(recipe_id: recipe.id, user_id: user.id)
      favorite.destroy
      redirect_to recipe
    else
      favorite = Favorite.create(recipe_id: recipe.id, user_id: user.id)
      redirect_to recipe
    end
  end

  private
  def favorited?(user, recipe)
    user.favorites.find_by(recipe_id: recipe.id)
  end

  # def recipe_params
  #   params.require(:recipe_id).permit()
end
