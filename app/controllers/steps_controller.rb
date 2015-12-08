class StepsController < ApplicationController
  def update
    step = Step.find(params[:id])
    if step.recipe.user_id == current_user.id 
        step.update(step_params)
        html_string = render_to_string "steps/_step", locals: {index: params['step']['index'].to_i, step: step}, layout: false
        render json: {template: html_string}
      else
        redirect_to @recipe, notice: "You don't have permission to edit this recipe. If you are the recipe owner, please log in to make changes."
      end
    # x = step.as_json
    # if request.xhr?
    #   render json: {template: x}
    # end
  end

  def destroy
    step = Step.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
     if @recipe.user_id == current_user.id 
        step.destroy
        redirect_to @recipe
      else
        redirect_to @recipe, notice: "You don't have permission to edit this recipe. If you are the recipe owner, please log in to make changes."
      end
      # html_string = render_to_string "steps/_step", locals: {index: params['step']['index'].to_i, step: step}, layout: false
      # render json: {template: html_string}
  end

  private
  def step_params
    params.require(:step).permit(:description)
  end
end