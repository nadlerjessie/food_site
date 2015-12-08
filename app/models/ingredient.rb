# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ingredient < ActiveRecord::Base
  has_many :proportions
  validates_presence_of :name
  validates_length_of :name, minimum: 1

  def self.top_ten_ingredients
  end

  def self.num_of_recipes
    # join on the recipes table and select ingredients by name, and return the number
    # of times that ingredient appears in a recipe
    binding.pry
    # join(:recipes).where('ingredient.name = self.name')
  end

end
