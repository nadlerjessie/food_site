class Search < ActiveRecord::Base
  def self.for(recipe, current_user)
    search = "%#{recipe.downcase}%"
    binding.pry
    search_based_on_user_status(search, current_user)
  end

  def search_based_on_user_status(search, current_user)
    if logged_in?
      Recipe.where("(lower(name) like ? AND public_recipe = ?) OR (lower(name) like ? AND user_id = ?)", search, true, search, current_user.id)
    else
      Recipe.where("lower(name) like ? and public_recipe = ?", search, true)
    end
  end

end







# select the recipe where the name matches search and the public_status is true OR a recipe whose name matches search and the recipe.user_id is equal to the current user
#
#   def current_user_permissions?
#     if logged_in?
#       true || false
#     else
#       true
#     end
#   end
#
#   def recipe_permissions?
#   end
#
# end

#search by ingredient, category, by user who created if



# method to hand the logic for permissions
