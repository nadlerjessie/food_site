class AdminsController < ApplicationController
  
  def analytics
    @rankings = Ingredient.most_used
    respond_to do |format|
      format.html
      format.json {render :json => {:rankings => @rankings}}
    end
  end


end