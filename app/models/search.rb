class Search < ActiveRecord::Base
  def self.for(recipe, current_user)
    search = "%#{recipe.downcase}%"
    binding.pry
    search_by_user_permissions(search, current_user)
  end

  def self.search_by_user_permissions(search, current_user)
    if current_user
      Recipe.joins(:ingredients).joins(:categories).where("((lower(recipes.name) like ? OR ingredients.name like ? OR categories.name like ?) AND public_recipe = ?) OR ((lower(recipes.name) like ? OR ingredients.name like ? OR categories.name like ?) AND user_id = ?)", search, search, search, true, search, search, search, current_user.id).uniq
    else
      Recipe.joins(:ingredients).joins(:categories).where("(lower(recipes.name) like ? OR ingredients.name like ? OR categories.name like ?) AND public_recipe = ?", search, search, search, true).uniq
    end
  end

end

#category, by user who created if



# method to hand the logic for permissions
"((lower(recipes.name) like ? OR ingredients.name like ? OR categories.name like ?) AND public_recipe = ?) OR ((lower(recipes.name) like ? OR ingredients.name like ? OR categories.name like ?) AND user_id = ?)"