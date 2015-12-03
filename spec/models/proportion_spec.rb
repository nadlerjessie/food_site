require 'pry'
require 'spec_helper'
require 'rails_helper'

RSpec.describe Proportion, type: :model do

  describe 'Proportion' do

    before do
      @recipe = Recipe.create(name: "Cookies")
      @proportion = Proportion.create(quantity: 100, recipe_id: @recipe.id)

      @proportion.ingredient_id = Ingredient.create(name: "flour").id
      @flour_id = @proportion.ingredient_id

      @proportion.unit_id = Unit.create(name: "cup").id
      @unit_id = @proportion.unit_id
    end

    it 'has an ingredient id' do
      expect(@proportion.ingredient_id).to eq @flour_id
    end

    it 'has an unit id' do
      expect(@proportion.unit_id).to eq @unit_id
    end

    it 'has an recipe id' do
      expect(@proportion.recipe_id).to eq @recipe.id
    end

    it 'has a quantity' do
      expect(Proportion.where(quantity: 100).first).to eq(@proportion)
    end
  end
end
