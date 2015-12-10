class StatesController < ApplicationController

  def map
  end


  def data
   state = find_selected_state(params['name'])
   state_seasons = find_current_state_seasons(state)
   ingredients = StateSeason.this_months_ingredients(state_seasons)
   html_string = render_to_string(partial: "states/seasons", locals: {:state => state, :ingredients => ingredients})
   render json: {template: html_string}
  end

private

  def find_selected_state(state)
    state_name = state.split('-').map { |word| word.capitalize }
    state_name = state_name.join('-')
    State.find_by(name: state_name)
  end

  def find_current_state_seasons(state)
    month = Time.now.month.to_s
    current_seasons = Season.where(month: month)
    StateSeason.where(state: state, season: current_seasons)
  end

end
