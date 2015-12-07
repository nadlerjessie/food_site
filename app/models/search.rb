class Search < ActiveRecord::Base
  def self.for(recipe, current_user)
    search = "%#{recipe.downcase}%"
    Recipe.search_by_user_permissions(search, current_user)
  end

end
