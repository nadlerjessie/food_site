require 'rails_helper'
RSpec.describe Recipe, type: :model do
  
  describe '#valid?' do 
    let(:recipe) {FactoryGirl.build(:recipe, name: name)}
    let(:name) {"Burger"}
    
    context "when the recipe doesn't have a name" do
      let(:name) {nil}
      it 'is invalid with no name' do 
        expect(recipe).to_not be_valid
      end
    end

    context 'when the recipe has no proportions' do
      it 'is invalid' do
        expect(recipe).to_not be_valid
      end
    end

    context 'when the recipe has no steps' do
      it 'is invalid' do
        expect(recipe).to_not be_valid
      end
    end

  end

  describe 'Recipe Associations' do
    let(:recipe) {FactoryGirl.build(:recipe)}

    context 'when creating a recipe' do
      let(:ingredient) {FactoryGirl.build(:ingredient)}
      let(:unit) {FactoryGirl.build(:unit)}
      let(:proportion) {FactoryGirl.build(:proportion)}
      let(:step) {FactoryGirl.build(:step)}

      it 'can have ingredients' do
        recipe.ingredients << ingredient
        expect(recipe.ingredients).to_not be_empty
      end

      it 'can have units' do
        recipe.units << unit
        expect(recipe.units).to_not be_empty
      end

      it 'can have proportions' do
        recipe.proportions << proportion
        expect(recipe.proportions).to_not be_empty
      end

      it 'can have steps' do
        recipe.steps << step
        expect(recipe.steps).to_not be_empty
      end       
    end
  end

  describe '#create_proportion' do
    let(:recipe) {FactoryGirl.build(:recipe)}
      
    context 'when creating a new recipe' do
      it 'can build a valid proportion without a quantity or unit' do
        new_proportion = recipe.create_proportion({quantity: ''}, {name: 'burrito'}, {name: ''})
        expect(new_proportion).to eq true
      end
    end
  end

  describe '.find_recipes' do
    #returns list of recipes with public set to true
    # 
  end


end











