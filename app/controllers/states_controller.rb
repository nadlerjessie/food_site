class StatesController < ApplicationController

  def map
  end

  def data
   state_name = params["name"].split("-").map {|word| word.capitalize}
   state_name = state_name.join("_")
   state = State.find_by(name: state_name)
   month = Time.now.month.to_s
   month_name = Time.now.strftime("%B")
   current_seasons = Season.where(month: month)
   state_seasons = StateSeason.where(state: state, season: current_seasons)
   ingredients = StateSeason.this_months_ingredients(state_seasons)
   html_string = render_to_string(partial: "states/seasons", locals: {:state => state, :month => month_name, :ingredients => ingredients})
   render json: {template: html_string}
  end


end
