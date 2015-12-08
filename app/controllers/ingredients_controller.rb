class IngredientsController < ApplicationController
  def most_common_ingredients
    @rankings = Ingredient.most_used
    respond_to do |format|
      format.html
      format.json {render :json => {:rankings => @rankings}}
    end

  end
end
