require 'pry'
require 'spec_helper'
require 'rails_helper'

RSpec.describe Proportion, type: :model do

  describe 'Proportion' do
    let(:proportion) {FactoryGirl.build(:proportion, quantity: quantity)}

      let(:quantity) {100}
      it 'has a quantity' do
        expect(quantity).to eq 100
      end

      let(:ingredient) {Ingredient.new(id: 300)}
      it 'has an ingredient_id' do
        expect(ingredient.id).to eq 300
      end

      let(:unit) {Unit.new(id: 300)}
      it 'has a unit_id' do
        expect(unit.id).to eq 300
      end

      let(:recipe) {Recipe.new(id: 300)}
      it 'has a recipe_id' do
        proportion.recipe_id = recipe.id
        expect(recipe.id).to eq 300
      end

  end
end
