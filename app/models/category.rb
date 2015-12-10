# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  has_many :ingredients, through: :recipes
  validates_presence_of :name

#join recipes
#find category with highest recipe count

  def self.top_categories(num)
    joins(:recipes).select('categories.*, count(recipes.id) as most_common_category').group('categories.id').order('most_common_category desc').limit(num)
  end

# joins(:favorites).select('recipes.*, count(favorites.id) as fav_count').group('recipes.id').order('fav_count desc').limit(num)



end
