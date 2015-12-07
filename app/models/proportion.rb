# == Schema Information
#
# Table name: proportions
#
#  id            :integer          not null, primary key
#  unit_id       :integer
#  ingredient_id :integer
#  quantity      :float
#  recipe_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Proportion < ActiveRecord::Base
  belongs_to :unit
  belongs_to :ingredient
  belongs_to :recipe
  validates_presence_of :ingredient
  
end
