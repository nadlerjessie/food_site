class ProportionsController < ApplicationController

  def create
    recipe = Recipe.find(proportion_params[:recipe_id])
    quantity = {quantity: proportion_params[:quantity]}
    ingredient = proportion_params[:ingredient]
    unit = proportion_params[:unit]
    proportion = recipe.create_proportion(quantity, ingredient, unit)
    render json: {quantity: quantity[:quantity], ingredient: ingredient[:name], unit: unit[:name]}
  end

  def update
    proportion = Proportion.find(params[:id])
    @recipe = Recipe.find(proportion_params[:recipe_id])
    proportion.update(quantity: proportion_params[:quantity])
    proportion.ingredient_id = Ingredient.find_or_create_by(proportion_params[:ingredient]).id
    proportion.unit_id = Unit.find_or_create_by(proportion_params[:unit]).id
    if proportion.save
      html_string = render_to_string "proportions/_proportion", locals: {proportion: proportion}, layout: false
      render json: {template: html_string}
    else
      redirect_to @recipe
    end
  end

  def destroy
    proportion = Proportion.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
      if @recipe.user_id == current_user.id 
        proportion.destroy
        redirect_to @recipe
      else
        redirect_to @recipe, notice: "You don't have permission to edit this recipe. If you are the recipe owner, please log in to make changes."
      end
  end


  private
  def proportion_params
    params.require(:proportion).permit(:quantity, :recipe_id, :ingredient =>[:name], :unit => [:name])
  end
end
