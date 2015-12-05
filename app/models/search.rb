class Search < ActiveRecord::Base
  def self.for(recipe, current_user)
    search = "%#{recipe.downcase}%"
    search_by_user_permissions(search, current_user)
  end

  def self.search_by_user_permissions(search, current_user)
    Recipe.joins(:ingredients).where("((lower(recipes.name) like ? OR ingredients.name like ? ) AND public_recipe = ?) OR ((lower(recipes.name) like ? OR ingredients.name like ? ) AND user_id = ?)", search, search, true, search, search, current_user.id).uniq  
  end
end
