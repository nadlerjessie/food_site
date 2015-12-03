require 'pry'
require 'spec_helper'
require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category' do
    let(:category) {FactoryGirl.build(:category, id: 132, name: name)}
    let(:stews) {FactoryGirl.build(:category, id: 222, name: 'stews')}

    let(:name) {'tex-mex'}
    it 'category has name' do
      expect(name).to eq name
    end

    let(:recipe) {Recipe.new(name: 'Burrito')}
    it 'can be associated with a recipe' do
      recipe.categories << category
      expect(recipe.categories.first.id).to eq category.id
    end

    let(:recipe) {Recipe.new(name: 'Burrito')}
    it 'can be associated with a recipe' do
      recipe.categories << category
      expect(recipe.categories.first.id).to eq category.id
    end

    let(:recipe) {Recipe.new(name: 'Burrito')}
    it 'can be associated with multiple recipes' do
      recipe.categories.push(category, stews)
      expect(recipe.categories.length).to eq 2
    end

  end
end
