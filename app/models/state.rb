class State < ActiveRecord::Base
  has_many :ingredient_states
  has_many :ingredients, through: :ingredient_states
  has_many :seasons, through: :ingredient_states
end
