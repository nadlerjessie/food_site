class FavoritesController < ApplicationController
 
  def create
    user = current_user
    recipe = Recipe.find(params[:recipe_id])
    if favorited?(user, recipe)
      favorite = Favorite.find_by(recipe_id: recipe.id, user_id: user.id)
      favorite.destroy
      html_string = render_to_string "favorites/_favorite", locals: {recipe: recipe, user: user}, layout: false
      render json: {template: html_string}
    else
      favorite = Favorite.create(recipe_id: recipe.id, user_id: user.id)
      html_string = render_to_string "favorites/_favorite", locals: {recipe: recipe, user: user}, layout: false
      render json: {template: html_string}
    end
  end

  private
  def favorited?(user, recipe)
    user.favorites.find_by(recipe_id: recipe.id)
  end

  # def recipe_params
  #   params.require(:recipe_id).permit()
end
