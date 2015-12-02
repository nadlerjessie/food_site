class Ingredient < ActiveRecord::Base
  has_many :proportions
end
