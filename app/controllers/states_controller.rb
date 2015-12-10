class StatesController < ApplicationController

  def map
  end

  def data
   state_name = params["name"].split("-").map {|word| word.capitalize}
   state_name = state_name.join("_")
   @state = State.find_by(name: state_name)
   @seasons = @state.seasons
   binding.pry
   html_string = render_to_string(partial: "states/seasons", locals: {:state => @state, :seasons => @seasons})
   binding.pry
   render json: {template: html_string}
  end


end
