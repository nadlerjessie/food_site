# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  name       :string
#  view_count :integer
#  public     :boolean
#  user_id    :integer
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :user
  has_many :proportions
  has_many :ingredients, through: :proportions
  has_many :units, through: :proportions
  has_many :steps
  accepts_nested_attributes_for :steps
  accepts_nested_attributes_for :proportions
  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :units



  def create_proportion(proportion, ingredient, unit)
    proportion.ingredient = ingredient
    proportion.unit = unit
    proportion.save
    
    # @ingredient = Ingredient.find_or_create_by(params[recipe][:ingredients][:name]])
    #@proportion = Unit.find_or_create_by(params[recipe][:ingredients][:id])
    # @proportion = Proportion.find_or_create_by(recipe][:proportions][:quantity])
    # @proportion.unit = @unit.id
    # @proportion.ingredient = @ingredient.id
    # @proportion.recipe = @recipe.id
  end

  # def proportions_attributes=(attributes_hash)
  #   attributes_hash.values.each do |proportion_attributes|
  #     self.proportions.build(proportion_attributes)
  #   end
  # end

  # def ingredients_attributes=(attributes_hash)
  #   attributes_hash.values.each do |ingredient_attributes|
  #     self.ingredients.build(ingredient_attributes)
  #   end
  # end

end


