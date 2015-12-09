class Season < ActiveRecord::Base
  has_many :ingredient_states
  has_many :ingredients, through: :ingredient_states
  has_many :states, through: :ingredient_states
end
