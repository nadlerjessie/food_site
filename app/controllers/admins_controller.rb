class AdminsController < ApplicationController
  before_action :admin_required
    
  def analytics
    @rankings = Ingredient.most_used
    respond_to do |format|
      format.html
      format.json {render :json => {:rankings => @rankings}}
    end
  end

  def most_viewed
    @most_viewed_recipes = Recipe.most_viewed(10)
    render 'admins/most_viewed'
  end


end