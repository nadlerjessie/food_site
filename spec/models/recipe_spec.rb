require 'rails_helper'
RSpec.describe Recipe, type: :model do
  
  describe '#valid?' do 
    let(:recipe) {FactoryGirl.build(:recipe, name: name, proportions: proportions, steps: steps)}
    let(:proportions) {[FactoryGirl.build(:proportion)]}
    let(:steps) {[FactoryGirl.build(:step)]}
    let(:name) {"Burger"}
    
    # context '' do 
    #   it 'scrapes' do 
    #     binding.pry
    #     recipe.test_scrape("")
    #   end
    # end
    context "when the recipe doesn't have a name" do
      let(:name) {nil}
      it 'is invalid without a name' do 
        expect(recipe).to_not be_valid
      end
    end

    context 'when the recipe has no proportions' do
      let(:proportions) {[]}
      it 'is invalid' do
        expect(recipe).to_not be_valid
      end
    end

    context 'when the recipe has no steps' do
      let(:steps) {[]}
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

      it 'can add ingredients' do
        recipe.ingredients << ingredient
        expect(recipe.ingredients).to_not be_empty
      end

      it 'can add units' do
        recipe.units << unit
        expect(recipe.units).to_not be_empty
      end

      it 'can add proportions' do
        recipe.proportions << proportion
        expect(recipe.proportions).to_not be_empty
      end

      it 'can add steps' do
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
    let(:step) {FactoryGirl.create(:step)}
    let(:ingredient) {FactoryGirl.create(:ingredient)}
    let(:proportion) {Proportion.create(ingredient_id: ingredient.id)}
    context 'when logged in and own private recipe' do
      let(:recipe_public) {FactoryGirl.create(:recipe, user_id: user.id, public_recipe: true, proportions: [proportion], steps: [step])}
      let(:recipe_private) {FactoryGirl.create(:recipe, name: 'Cookies', user_id: current_user.id, public_recipe: false, proportions: [proportion], steps: [step])}
      let(:current_user) {FactoryGirl.create(:user, email: 'girlygirl@yahoo.com')}
      let(:user) {FactoryGirl.create(:user)}
      it "displays user's private recipes and public recipes" do
        recipe_private
        recipe_public
        expect(Recipe.find_recipes(current_user).size).to eq(2)
      end
    end

    context "when logged in and don't own private recipe" do
      let(:recipe_public) {FactoryGirl.create(:recipe, user_id: current_user.id, public_recipe: true, proportions: [proportion], steps: [step])}
      let(:recipe_private) {FactoryGirl.create(:recipe, name: 'Cookies', user_id: user.id, public_recipe: false, proportions: [proportion], steps: [step])}
      let(:current_user) {FactoryGirl.create(:user, email: 'girlygirl@yahoo.com')}
      let(:user) {FactoryGirl.create(:user)}
      it "displays only public recipes" do
        recipe_private
        recipe_public
        expect(Recipe.find_recipes(current_user).size).to eq(1)
      end
    end


    context "when logged out" do
      let(:recipe_public) {FactoryGirl.create(:recipe, user_id: current_user.id, public_recipe: true, proportions: [proportion], steps: [step])}
      let(:recipe_private) {FactoryGirl.create(:recipe, name: 'Cookies', user_id: user.id, public_recipe: false, proportions: [proportion], steps: [step])}
      let(:user) {FactoryGirl.create(:user)}
      let(:current_user) {Guest.new}
      it "displays only public recipes" do
        recipe_private
        recipe_public
        expect(Recipe.find_recipes(current_user).size).to eq(1)
      end
    end
  end
end











