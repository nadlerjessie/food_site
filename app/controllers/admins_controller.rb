class AdminsController < ApplicationController
  before_action :admin_required
    
  def top_ingredients
    @rankings = Ingredient.most_used
    respond_to do |format|
      format.html
      format.json {render :json => {:rankings => @rankings}}
    end
  end

  def most_viewed
    @most_viewed_recipes = Recipe.most_viewed(12)
  end

  def most_favorited
    @most_favorited_recipes = Recipe.most_favorited(12)
  end


end