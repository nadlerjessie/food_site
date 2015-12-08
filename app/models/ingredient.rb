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

  def self.most_used
    ascending_array = Recipe.num_of_ingredient.sort_by do |ingredient, count|
      count
    end
    top_ten = ascending_array.reverse[0..9]
    top_ten.each_with_object([]) do |ingredient, array|
      hash = {name: ingredient[0], count: ingredient[1]}
      array.push(hash)
    end
  end

end
