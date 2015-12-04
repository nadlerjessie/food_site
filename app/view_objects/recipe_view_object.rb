class RecipeViewObject
  attr_reader :recipe, :categories

  def initialize(recipe)
    @recipe = recipe
    @categories = @recipe.categories
  end

  def list
    categories.map {|category| category.name.capitalize}.join(" | ")
  end

  def created_by
    if recipe.user
      "From #{recipe.user.name}'s Kitchen"
    end
  end
end