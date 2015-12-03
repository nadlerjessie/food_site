class RecipeViewObject
  attr_reader :recipe, :categories

  def initialize(recipe)
    @recipe = recipe
    @categories = @recipe.categories
  end

  def list
    list_of_categories = ""
    categories.each do |category|
      list_of_categories += "#{category.name.capitalize} | "
    end
    list_of_categories[0...-2]
  end

  def created_by
    if recipe.user
      "From #{recipe.user.name}'s Kitchen"
    end
  end
end