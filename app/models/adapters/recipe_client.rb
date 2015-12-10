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

    def set_proportion_with_initialized_attributes(proportion, recipe)
      new_proportion = recipe.proportions.build
      new_proportion.quantity = 0
      new_proportion.unit = Unit.new
      new_proportion.ingredient = Ingredient.new
      new_proportion
    end

    def add_unit_and_ingredient_to_proportion(new_proportion, proportion, i)
      new_proportion.unit.name = proportion[i+1]
      ingredient = Ingredient.find_or_initialize_by(name: (proportion[(i+2)..-1]).join(" "))
      if ingredient.valid?
        new_proportion.ingredient = ingredient
      end
    end

    def set_proportion_with_ingredient_only(new_proportion, proportion)
      new_proportion.quantity = nil
      new_proportion.unit = nil
      ingredient = Ingredient.find_or_create_by(name: proportion.join(" "))
      new_proportion.ingredient = ingredient
    end

    def first_item_in_conversions_table?(proportion_piece)
      conversions = { "1/8" => 0.125, "1/4" => 0.25, "1/3" => 0.333, "1/2" => 0.5, "2/3" => 0.667, "3/4" => 0.75}
      conversions[proportion_piece]
    end

    def first_item_integer?(proportion_piece)
      proportion_piece.to_i != 0
    end

    def set_proportion_attributes_by_quantity_type(proportion_array, new_proportion)
      conversions = { "1/8" => 0.125, "1/4" => 0.25, "1/3" => 0.333, "1/2" => 0.5, "2/3" => 0.667, "3/4" => 0.75}
      proportion_array.each_with_index do |proportion_piece, i|
        if first_item_in_conversions_table?(proportion_piece)
          new_proportion.quantity += conversions[proportion_piece]
          add_unit_and_ingredient_to_proportion(new_proportion, proportion_array, i)
          break
        elsif first_item_integer?(proportion_piece)
          new_proportion.quantity += proportion_piece.to_i
          add_unit_and_ingredient_to_proportion(new_proportion, proportion_array, i)
          break
        else
          set_proportion_with_ingredient_only(new_proportion, proportion_array)
          break
        end
      end
    end

    def build_proportions(recipe, proportions)
      proportions.each do |proportion_array|
        new_proportion = set_proportion_with_initialized_attributes(proportion_array, recipe)
        set_proportion_attributes_by_quantity_type(proportion_array, new_proportion)
        new_proportion.save
      end
      recipe
    end

    def get_recipe_attributes_from_url(url)
      results = connection.get_recipe(url)
    end

    def create_recipe(url)
      recipe_attributes = connection.get_recipe(url)
      if recipe_attributes
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
end
