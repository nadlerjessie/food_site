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


###### ADD LATER TO ENSURE INPUT TO DATABASE IS CORRECT ######
  # ,reject_if: proc {|attributes| attributes[:name].blank?}
#######################




  def create_proportion(proportion, ingredient, unit)
    proportion.ingredient = ingredient
    proportion.unit = unit
    proportion.save
  end

end


