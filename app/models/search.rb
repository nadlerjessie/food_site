class Search < ActiveRecord::Base
  def self.for(recipe)
    search = "%#{recipe.downcase}%"
    permissions = true
    x = Recipe.where("lower(name) like ? and public_recipe = ?", search, permissions)
  end
end

#search by ingredient, category, by user who created if public = false
