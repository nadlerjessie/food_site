class StepsController < ApplicationController
  def update
    step = Step.find(params[:id])
    step.update(step_params)
    # html_string = render_to_string "steps/_step", locals: {step: step}, layout: false
    x = step.as_json
    if request.xhr?
      render json: {template: x}
    end
  end

  private
  def step_params
    params.require(:step).permit(:description)
  end
end
