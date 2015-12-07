class FavoriteViewObject
  attr_reader :recipe, :user

  def initialize(recipe, user)
    @recipe = recipe
    @user = user
  end

  def icon_class
    if user.favorites.where(recipe_id: recipe.id) != []
      return 'fa fa-heart' 
    else
      return 'fa fa-heart-o'
    end
  end

end