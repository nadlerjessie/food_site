module Adapters
  class RecipeClient
    def connection
      @connection = Adapters::FoodNetworkConnection.new
    end

    def build_steps(recipe, steps)
      steps.each {|step| recipe.steps.build(description: step)}
    end

    def build_categoires(recipe, categories)
      categories.each do |category|
        new_category = Category.find_or_create_by(name: category)
        recipe.categories.push(new_category)
      end
    end

    def build_proportions(recipe, proportions)
      conversions = { "1/8" => 0.125, "1/4" => 0.25, "1/3" => 0.333, "1/2" => 0.5, "2/3" => 0.667, "3/4" => 0.75}
      proportions.each do |proportion|
        new_proportion = recipe.proportions.build
        new_proportion.quantity = 0
        new_proportion.unit = Unit.new 
        proportion.each_with_index do |proportion_piece, i|
          if conversions[proportion_piece]
            new_proportion.quantity += conversions[proportion_piece]
            new_proportion.unit.name = proportion[i+1]
            ingredient = Ingredient.find_or_create_by(name: (proportion[(i+2)..-1]).join(" "))
            new_proportion.ingredient = ingredient
            break
          elsif proportion_piece.to_i != 0
            new_proportion.quantity += proportion_piece.to_i
            new_proportion.unit.name = proportion[i+1]
            ingredient = Ingredient.find_or_create_by(name: (proportion[(i+2)..-1]).join(" "))
            new_proportion.ingredient = ingredient
            break
          else 
            new_proportion.quantity = nil
            new_proportion.unit = nil
            ingredient = Ingredient.find_or_create_by(name: proportion.join(" "))
            new_proportion.ingredient = ingredient
            break
          end
        end
        new_proportion.save
      end
      recipe
    end

    def get_recipe_attributes_from_url(url)
      results = connection.get_recipe(url)
    end

    def create_recipe(url)
      recipe_attributes = connection.get_recipe(url)
      recipe = Recipe.new(name: recipe_attributes.first, image_url: recipe_attributes.last)
      build_proportions(recipe, recipe_attributes[1])
      build_steps(recipe, recipe_attributes[2][0...-1])
      build_categoires(recipe, recipe_attributes[3])
      recipe.note = recipe_attributes[2][-1]
      recipe.save
      recipe
    end
  end
end