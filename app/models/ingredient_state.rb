class IngredientState < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :state
  belongs_to :season
end
