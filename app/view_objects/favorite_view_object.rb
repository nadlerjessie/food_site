class FavoriteViewObject
  attr_reader :recipe, :user

  def initialize(recipe, user)
    @recipe = recipe
    @user = user
  end

 def icon_class
    if user.favorites.where(recipe_id: recipe.id) == []
      'fa fa-heart-o' 
    else
      'fa fa-heart'
    end
  end

end