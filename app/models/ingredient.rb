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
  has_many :ingredient_states
  has_many :seasons, through: :ingredient_states
  has_many :states, through: :ingredient_states
  validates_presence_of :name
  validates_length_of :name, minimum: 1

  def self.filter_results
    Recipe.num_of_ingredient.delete_if {|name, count| name.downcase.include?("salt")|| name.downcase.include?("juiced")|| name.downcase.include?("garlic")||name.downcase.include?("pepper")||name.downcase.include?("oil")}
  end

  def self.most_used
    ascending_array = Ingredient.filter_results.sort_by do |ingredient, count|
      count
    end
    top_ten = ascending_array.reverse[0..9]
    top_ten.each_with_object([]) do |ingredient, array|
      hash = {name: ingredient[0], count: ingredient[1]}
      array.push(hash)
    end
  end

end
