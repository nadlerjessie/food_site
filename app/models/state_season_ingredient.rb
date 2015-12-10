class StateSeasonIngredient < ActiveRecord::Base
  belongs_to :state_season
  belongs_to :ingredient
end
