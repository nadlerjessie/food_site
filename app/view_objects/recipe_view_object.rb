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
    elsif recipe.note
      "From the Food Network Collection: #{recipe.note}"
    end
  end

  def image_alt
    if recipe.image_url == "default_photo.jpg"
      "Credit: Free Food Photos"
    else
      recipe.name
    end
  end

  def image_url
    if recipe.image_url
      recipe.image_url
    else
      "default_photo.jpg"
    end
  end

  def categories_class
    recipe.categories.map(&:name).join(' ')
  end
end