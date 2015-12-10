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
  validate :ingredient_is_persisted
  accepts_nested_attributes_for :ingredient
  accepts_nested_attributes_for :unit

  private

  def ingredient_is_persisted
    if !self.ingredient.valid?
      self.errors[:ingredient] = "cannot be blank"
    end
  end
end
