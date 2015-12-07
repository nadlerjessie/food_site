class FavoritesController < ApplicationController
 
#  def favorited?
#   binding.pry
#   # if current_user.favorites.find_by(recipe_params)
#   #   destroy
#   # else 
#   #   create
#   # end
# end

  def create
    user = current_user
    recipe = Recipe.find(params[:recipe_id])
    if favorited?(user, recipe)
      favorite = Favorite.find_by(recipe_id: recipe.id, user_id: user.id)
      favorite.destroy
    else
      favorite = Favorite.create(recipe_id: recipe.id, user_id: user.id)
    end
  end

  private
  def favorited?(user, recipe)
    user.favorites.find_by(recipe_id: recipe.id)
  end

  # def recipe_params
  #   params.require(:recipe_id).permit()
end
