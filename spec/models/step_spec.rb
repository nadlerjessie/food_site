require 'pry'
require 'spec_helper'
require 'rails_helper'

RSpec.describe Step, type: :model do

  describe 'Step' do
    let(:step) {FactoryGirl.build(:step, description: description)}

      let(:description) {'bring to a rolling boil'}
      it 'has a description' do
        expect(description).to eq 'bring to a rolling boil'
      end

      let(:recipe) {Recipe.new(id: 300)}
      it 'has an recipe_id' do
        step.recipe_id = recipe.id
        expect(step.recipe_id).to eq recipe.id
      end

  end
end
